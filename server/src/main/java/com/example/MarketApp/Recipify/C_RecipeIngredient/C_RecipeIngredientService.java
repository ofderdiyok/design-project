package com.example.MarketApp.Recipify.C_RecipeIngredient;

import com.example.MarketApp.Recipify.C_RecipeIngredient.dto.C_RecipeIngredientDetailDto;
import com.example.MarketApp.Recipify.Ingredient.Ingredient;
import com.example.MarketApp.Recipify.Ingredient.IngredientService;
import com.example.MarketApp.Recipify.Ingredient.dto.IngredientDetailDto;
import com.example.MarketApp.Recipify.Recipe.Recipe;
import com.example.MarketApp.Recipify.Recipe.RecipeService;
import com.example.MarketApp.Recipify.Recipe.dto.RecipeDetailDto;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class C_RecipeIngredientService {
    private final C_RecipeIngredientRepository cRecipeIngredientRepository;
    private final RecipeService recipeService;
    private final IngredientService ingredientService;

    public C_RecipeIngredientService(C_RecipeIngredientRepository cRecipeIngredientRepository, RecipeService recipeService, IngredientService ingredientService) {
        this.cRecipeIngredientRepository = cRecipeIngredientRepository;
        this.recipeService = recipeService;
        this.ingredientService = ingredientService;
    }

    public C_RecipeIngredient toEntity(C_RecipeIngredientDetailDto detailDto){
        if (detailDto == null) {
            return null;
        }

        C_RecipeIngredient entity = new C_RecipeIngredient();
        if (detailDto.getId() != null){
            Optional<C_RecipeIngredient> entityFound = this.cRecipeIngredientRepository.findById(detailDto.getId());
            if (entityFound.isPresent()){
                entity = entityFound.get();
            }
        }

        entity.setId(detailDto.getId());
        entity.setRecipe(detailDto.getRecipe() != null ? this.recipeService.toDirectlyEntity(detailDto.getRecipe()) : null);
        entity.setIngredient(detailDto.getIngredient() != null ? this.ingredientService.toDirectlyEntity(detailDto.getIngredient()) : null);

        return entity;
    }

    public C_RecipeIngredientDetailDto toDetailDto(C_RecipeIngredient entity){
        if (entity == null){
            return null;
        }

        C_RecipeIngredientDetailDto detailDto = new C_RecipeIngredientDetailDto();
        detailDto.setId(entity.getId());
        detailDto.setRecipe(entity.getRecipe() != null ? recipeService.toDetailDto(entity.getRecipe()) : null);
        detailDto.setIngredient(entity.getIngredient() != null ? ingredientService.toDetailDto(entity.getIngredient()) : null);

        return detailDto;
    }

    public List<C_RecipeIngredient> findAll(){
        return this.cRecipeIngredientRepository.findAll();
    }

    public C_RecipeIngredientDetailDto saveOrUpdate(C_RecipeIngredientDetailDto detailDto) throws Exception {
        if (detailDto == null){
            throw new Exception("Recipe - Ingredients couldn't find!");
        }

        if (detailDto.getRecipe() == null || detailDto.getIngredient() == null){
            throw new Exception("Parameters could not be found. Please choose from existing recipe and ingredients.");
        }

        // recipe check
        Optional<Recipe> recipe = this.recipeService.getRecipeRepository().findById(detailDto.getRecipe().getId());
        if (recipe.isEmpty()){
            throw new Exception("Recipe could not be found. Please choose from existing recipes.");
        }

        // ingredient check
        Optional<Ingredient> ingredient = this.ingredientService.getIngredientRepository().findById(detailDto.getIngredient().getId());
        if (ingredient.isEmpty()){
            throw new Exception("Ingredient could not be found. Please choose from existing ingredient.");
        }

        C_RecipeIngredient cRecipeIngredient = toEntity(detailDto);
        C_RecipeIngredient updatedOrSavedEntity = this.cRecipeIngredientRepository.save(cRecipeIngredient);


        return toDetailDto(updatedOrSavedEntity);
    }
}
