package com.example.MarketApp.Recipify.CERecipeIngredient;

import com.example.MarketApp.Recipify.CERecipeIngredient.dto.CERecipeIngredientDetailDto;
import com.example.MarketApp.Recipify.Ingredient.IngredientService;
import com.example.MarketApp.Recipify.Recipe.RecipeService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class CERecipeIngredientService {
    private final CERecipeIngredientRepository ceRecipeIngredientRepository;
    private final RecipeService recipeService;
    private final IngredientService ingredientService;

    public CERecipeIngredientService(CERecipeIngredientRepository ceRecipeIngredientRepository, RecipeService recipeService, IngredientService ingredientService) {
        this.ceRecipeIngredientRepository = ceRecipeIngredientRepository;
        this.recipeService = recipeService;
        this.ingredientService = ingredientService;
    }

    public CERecipeIngredientDetailDto setBaseProperties(CERecipeIngredientDetailDto dto, CERecipeIngredient entity){
        dto.setId(entity.getId());
        dto.setCreatedBy(entity.getCreatedBy());
        dto.setCreatedDate(entity.getCreatedDate());
        dto.setLastUpdatedBy(entity.getLastUpdatedBy());
        dto.setLastUpdatedDate(entity.getLastUpdatedDate());
        return dto;
    }

    public CERecipeIngredient toEntity(CERecipeIngredientDetailDto detailDto){
        if (detailDto == null) {
            return null;
        }

        CERecipeIngredient entity = new CERecipeIngredient();
        if (detailDto.getId() != null){
            Optional<CERecipeIngredient> entityFound = this.ceRecipeIngredientRepository.findById(detailDto.getId());
            if (entityFound.isPresent()){
                entity = entityFound.get();
            }
        }

        entity.setId(detailDto.getId());
        entity.setRecipe(detailDto.getRecipeDetailDto() != null ? this.recipeService.findEntity(detailDto.getRecipeDetailDto()) :  null);
        entity.setIngredient(detailDto.getIngredientDetailDto() != null ? this.ingredientService.findEntity(detailDto.getIngredientDetailDto()) : null);

        return entity;
    }

    public CERecipeIngredientDetailDto toDetailDto(CERecipeIngredient entity){
        if (entity == null) {
            return null;
        }

        CERecipeIngredientDetailDto detailDto = new CERecipeIngredientDetailDto();
        detailDto = setBaseProperties(detailDto, entity);
        detailDto.setRecipeDetailDto(entity.getRecipe() != null ? this.recipeService.toDetailDto(entity.getRecipe()) : null);
        detailDto.setIngredientDetailDto(entity.getIngredient() != null ? this.ingredientService.toDetailDto(entity.getIngredient()) : null);

        return detailDto;
    }

    public List<CERecipeIngredient> findAll(){
        List<CERecipeIngredient> ceRecipeIngredientList = this.ceRecipeIngredientRepository.findAll();
        return ceRecipeIngredientList;
    }

    public CERecipeIngredientDetailDto saveOrUpdate(CERecipeIngredientDetailDto detailDto){
        CERecipeIngredient ceRecipeIngredient = toEntity(detailDto);
        CERecipeIngredient updatedOrSavedEntity = this.ceRecipeIngredientRepository.save(ceRecipeIngredient);
        return toDetailDto(updatedOrSavedEntity);
    }

    @Transactional
    public void deleteEntity(CERecipeIngredientDetailDto detailDto){
        this.ceRecipeIngredientRepository.deleteById(detailDto.getId());
    }
}
