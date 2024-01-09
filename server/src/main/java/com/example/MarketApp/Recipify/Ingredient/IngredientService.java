package com.example.MarketApp.Recipify.Ingredient;

import com.example.MarketApp.Recipify.Ingredient.dto.IngredientDetailDto;
import com.example.MarketApp.Recipify.Recipe.RecipeService;
import com.example.MarketApp.business.base.repository.BaseRepository;
import com.example.MarketApp.business.base.service.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class IngredientService extends BaseService<Ingredient> {
    private final IngredientRepository ingredientRepository;
    private final RecipeService recipeService;

    public IngredientService(IngredientRepository ingredientRepository, RecipeService recipeService) {
        this.ingredientRepository = ingredientRepository;
        this.recipeService = recipeService;
    }

    public BaseRepository<Ingredient> getRepository(){
        return this.ingredientRepository;
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

        entity.setName(detailDto.getName());
        entity.setRecipe(this.recipeService.getRepository().findById(detailDto.getRecipe().getId()).get());

        return entity;
    }

    public IngredientDetailDto toDetailDto(Ingredient ingredient){
        if (ingredient == null) {
            return null;
        }

        IngredientDetailDto detailDto = new IngredientDetailDto();
        detailDto = setBaseDtoProperties(detailDto, ingredient);
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
