package com.example.MarketApp.Recipify.ImageStorage;

import com.example.MarketApp.Recipify.Ingredient.dto.IngredientSelectImplDto;
import com.example.MarketApp.Recipify.Recipe.Recipe;
import com.example.MarketApp.Recipify.Recipe.RecipeService;
import com.example.MarketApp.Recipify.Recipe.dto.RecipeSearchDto;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

@RestController
@RequestMapping("api/imagestorage")
public class ImageStorageController {

    private final ImageStorageService imageStorageService;
    private final RecipeService recipeService;

    public ImageStorageController(ImageStorageService imageStorageService, RecipeService recipeService) {
        this.imageStorageService = imageStorageService;
        this.recipeService = recipeService;
    }

    @PostMapping("/uploadImage")
    public List<Recipe> uploadImage(@RequestParam("image") MultipartFile file) throws IOException {
        ImageStorage uploadImage = imageStorageService.uploadImage(file);

        //pythondan detect edilen ürünleri liste olarak dönecek
        String pythonApiUrl = "http://127.0.0.1:5000/getDetectedIngredients";

        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(uploadImage);
        HttpEntity<String> request = new HttpEntity<>(json, headers);

        try {
            ResponseEntity<String> response = restTemplate.postForEntity(pythonApiUrl, request, String.class);

            int[] detectedIngredients = null;

            RecipeSearchDto recipeSearchDto = new RecipeSearchDto();
            List<IngredientSelectImplDto> searchDtoList = new ArrayList<>();

            if (response.getBody()!=null){
                String responseBody = response.getBody();
                responseBody = responseBody.replaceAll("\n", "");
                responseBody = responseBody.replaceAll("\\[|\\]", "");

                String[] parts = responseBody.split(", ");

                detectedIngredients = new int[parts.length];

                for (int i = 0; i < parts.length; i++) {
                    detectedIngredients[i] = (int) Double.parseDouble(parts[i]);
                }

                HashSet<Integer> uniqueSetectedIngredientsSet = new HashSet<>();
                for (int num : detectedIngredients) {
                    uniqueSetectedIngredientsSet.add(num);
                }
                ArrayList<Integer> uniqueSetectedIngredients = new ArrayList<>(uniqueSetectedIngredientsSet);

                for (int i=0; i<uniqueSetectedIngredients.size(); i++){
                    IngredientSelectImplDto implDto = new IngredientSelectImplDto();
                    implDto.setId((long) uniqueSetectedIngredients.get(i));
                    searchDtoList.add(implDto);
                }
            }

            recipeSearchDto.setIngredientSelectImplDtoList(searchDtoList);
            List<Recipe> recipeList = recipeService.findAllByExample(recipeSearchDto);

            return recipeList;
        } catch (Exception e) {
            return null;
            //return ResponseEntity.status(500).body("Python API isteği başarısız oldu. Hata: " + e.getMessage());
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> downloadImage(@PathVariable Long id){
        byte[] imageData = imageStorageService.downloadImage(id);
        return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.valueOf("image/png")).body(imageData);
    }
}
