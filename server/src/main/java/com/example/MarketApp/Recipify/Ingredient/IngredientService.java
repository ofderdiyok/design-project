package com.example.MarketApp.Recipify.Ingredient;

import com.example.MarketApp.Recipify.Ingredient.dto.IngredientDetailDto;
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

    public IngredientDetailDto setBaseProperties(IngredientDetailDto dto, Ingredient entity){
        dto.setId(entity.getId());
        dto.setCreatedBy(entity.getCreatedBy());
        dto.setCreatedDate(entity.getCreatedDate());
        dto.setLastUpdatedBy(entity.getLastUpdatedBy());
        dto.setLastUpdatedDate(entity.getLastUpdatedDate());
        return dto;
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
        detailDto = setBaseProperties(detailDto, ingredient);
        detailDto.setName(ingredient.getName());

        return detailDto;
    }

    public List<Ingredient> findAll(){
        List<Ingredient> ingredientList = this.ingredientRepository.findAll();
        return ingredientList;
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
