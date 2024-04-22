package com.example.MarketApp.Recipify.ImageStorage;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@RestController
@RequestMapping("api/imagestorage")
public class ImageStorageController {

    private final ImageStorageService imageStorageService;

    public ImageStorageController(ImageStorageService imageStorageService) {
        this.imageStorageService = imageStorageService;
    }

    @PostMapping("/uploadImage")
    public ResponseEntity<?> uploadImage(@RequestParam("image") MultipartFile file) throws IOException {
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

            //dönen listeyi arama algoritmasına sokacağız. recipeları liste olarak döneceğiz en son

            return response;
        } catch (Exception e) {
            return ResponseEntity.status(500).body("Python API isteği başarısız oldu. Hata: " + e.getMessage());
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> downloadImage(@PathVariable Long id){
        byte[] imageData = imageStorageService.downloadImage(id);
        return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.valueOf("image/png")).body(imageData);
    }
}
