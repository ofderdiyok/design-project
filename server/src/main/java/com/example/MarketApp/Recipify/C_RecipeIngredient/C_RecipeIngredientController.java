package com.example.MarketApp.Recipify.C_RecipeIngredient;

import com.example.MarketApp.Recipify.C_RecipeIngredient.dto.C_RecipeIngredientDetailDto;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/crecipeingredient")
public class C_RecipeIngredientController {
    private final C_RecipeIngredientService cRecipeIngredientService;

    public C_RecipeIngredientController(C_RecipeIngredientService cRecipeIngredientService) {
        this.cRecipeIngredientService = cRecipeIngredientService;
    }

    @GetMapping("/list")
    public List<C_RecipeIngredient> findAll(){
        return this.cRecipeIngredientService.findAll();
    }

    @PostMapping("/save")
    public C_RecipeIngredientDetailDto saveEntity(@RequestBody C_RecipeIngredientDetailDto detailDto) throws Exception {
        return this.cRecipeIngredientService.saveOrUpdate(detailDto);
    }
}
