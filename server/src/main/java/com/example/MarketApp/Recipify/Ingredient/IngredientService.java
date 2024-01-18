package com.example.MarketApp.Recipify.Ingredient;

import com.example.MarketApp.Recipify.Ingredient.dto.IngredientDetailDto;
import com.example.MarketApp.Recipify.Recipe.RecipeService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class IngredientService {
    private final IngredientRepository ingredientRepository;

    public IngredientService(IngredientRepository ingredientRepository) {
        this.ingredientRepository = ingredientRepository;
    }

    public Ingredient toEntity(IngredientDetailDto detailDto){
        if (detailDto == null) {
            return null;
        }

        Ingredient entity = new Ingredient();
        if (detailDto.getId() != null){
            Optional<Ingredient> entityFound = this.ingredientRepository.findById(detailDto.getId());
            if (entityFound.isPresent()){
                entity = entityFound.get();
            }
        }

        entity.setId(detailDto.getId());
        entity.setName(detailDto.getName());

        return entity;
    }

    public IngredientDetailDto toDetailDto(Ingredient ingredient){
        if (ingredient == null) {
            return null;
        }

        IngredientDetailDto detailDto = new IngredientDetailDto();
        detailDto.setId(ingredient.getId());
        detailDto.setName(ingredient.getName());

        return detailDto;
    }

    public List<Ingredient> findAll(){
        return this.ingredientRepository.findAll();
    }

    public IngredientDetailDto saveOrUpdate(IngredientDetailDto detailDto){
        Ingredient ingredient = toEntity(detailDto);
        Ingredient updatedOrSavedEntity = this.ingredientRepository.save(ingredient);
        return toDetailDto(updatedOrSavedEntity);
    }

    @Transactional
    public void deleteEntity(IngredientDetailDto detailDto){
        this.ingredientRepository.deleteById(detailDto.getId());
    }
}
