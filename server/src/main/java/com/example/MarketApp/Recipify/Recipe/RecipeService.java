package com.example.MarketApp.Recipify.Recipe;

import com.example.MarketApp.Recipify.C_RecipeIngredient.C_RecipeIngredient;
import com.example.MarketApp.Recipify.C_RecipeIngredient.C_RecipeIngredientRepository;
import com.example.MarketApp.Recipify.C_RecipeIngredient.C_RecipeIngredientService;
import com.example.MarketApp.Recipify.C_RecipeIngredient.dto.C_RecipeIngredientDetailDto;
import com.example.MarketApp.Recipify.Ingredient.Ingredient;
import com.example.MarketApp.Recipify.Ingredient.IngredientService;
import com.example.MarketApp.Recipify.Ingredient.dto.IngredientDetailDto;
import com.example.MarketApp.Recipify.Recipe.dto.RecipeDetailDto;
import com.example.MarketApp.Recipify.Recipe.dto.RecipeSearchDto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class RecipeService {
    private final RecipeRepository recipeRepository;
    private final IngredientService ingredientService;
    private final C_RecipeIngredientRepository c_RecipeIngredientRepository;

    @Autowired
    public RecipeService(RecipeRepository recipeRepository,
            IngredientService ingredientService,
            C_RecipeIngredientRepository c_RecipeIngredientRepository) {
        this.recipeRepository = recipeRepository;
        this.ingredientService = ingredientService;
        this.c_RecipeIngredientRepository = c_RecipeIngredientRepository;
    }

    public RecipeRepository getRecipeRepository() {
        return recipeRepository;
    }

    public Recipe toEntity(RecipeDetailDto detailDto) {
        if (detailDto == null) {
            return null;
        }

        Recipe entity = new Recipe();
        if (detailDto.getId() != null) {
            Optional<Recipe> entityFound = this.recipeRepository.findById(detailDto.getId());
            if (entityFound.isPresent()) {
                entity = entityFound.get();
            }
        }

        entity.setName(detailDto.getName());
        entity.setDescription(detailDto.getDescription());
        entity.setCalories(detailDto.getCalories());
        entity.setImage(detailDto.getImage());

        return entity;
    }

    public Recipe toDirectlyEntity(RecipeDetailDto detailDto) {
        if (detailDto == null) {
            return null;
        }

        Recipe entity = new Recipe();
        if (detailDto.getId() != null) {
            Optional<Recipe> entityFound = this.recipeRepository.findById(detailDto.getId());
            if (entityFound.isPresent()) {
                entity = entityFound.get();
            }
        }

        return entity;
    }

    public RecipeDetailDto toDetailDto(Recipe recipe) {
        if (recipe == null) {
            return null;
        }

        RecipeDetailDto detailDto = new RecipeDetailDto();
        detailDto.setId(recipe.getId());
        detailDto.setName(recipe.getName());
        detailDto.setDescription(recipe.getDescription());
        detailDto.setCalories(recipe.getCalories());
        detailDto.setImage(recipe.getImage());

        return detailDto;
    }

    public List<Recipe> findAll() {
        return this.recipeRepository.findAll();
    }

    public RecipeDetailDto saveOrUpdate(RecipeDetailDto detailDto) {
        Recipe recipe = toEntity(detailDto);
        Recipe updatedOrSavedEntity = this.recipeRepository.save(recipe);
        // detailDto
        // detailDto entity contains arraylist input of ingredients, it will create a
        // crecipies object and save the ingredients there
        for (String ingredientName : detailDto.getIngredients()) {
            // if the ingredient exists, create a crecipies with it
            if (ingredientService.ingredientExistsByName(ingredientName)) {
                // initialize detailDtoParam parameter for saveOrUpdate function
                Ingredient ingredient = ingredientService.getIngredientByName(ingredientName);
                // entity is the recipe object created
                C_RecipeIngredient cRecipeIngredient = new C_RecipeIngredient();
                cRecipeIngredient.setIngredient(ingredient);
                cRecipeIngredient.setRecipe(updatedOrSavedEntity);
                try {
                    c_RecipeIngredientRepository.save(cRecipeIngredient);
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
                System.out.println("Ingredient: " + ingredientName + " already exists");
            }
            // if it doesn't exist, create the ingredient object first, then make the
            // crecipies object
            else {
                IngredientDetailDto ingredientDto = new IngredientDetailDto();
                ingredientDto.setName(ingredientName);
                ingredientService.saveOrUpdate(ingredientDto);
                Ingredient ingredient = ingredientService.getIngredientByName(ingredientName);
                C_RecipeIngredient cRecipeIngredient = new C_RecipeIngredient();
                cRecipeIngredient.setIngredient(ingredient);
                cRecipeIngredient.setRecipe(updatedOrSavedEntity);
                try {
                    c_RecipeIngredientRepository.save(cRecipeIngredient);
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
                System.out.println("Ingredient: " + ingredientName + " didn't exist before, now added");
            }
        }
        //
        return toDetailDto(updatedOrSavedEntity);
    }

    @Transactional
    public void deleteEntity(RecipeDetailDto detailDto) {
        this.recipeRepository.deleteById(detailDto.getId());
    }

    public List<Recipe> findAllByExample(RecipeSearchDto searchDto) {
        return this.recipeRepository.findByExample(searchDto);
    }
}
