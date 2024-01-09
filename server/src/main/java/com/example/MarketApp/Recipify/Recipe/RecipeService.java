package com.example.MarketApp.Recipify.Recipe;

import com.example.MarketApp.Recipify.Recipe.dto.RecipeDetailDto;
import com.example.MarketApp.business.base.repository.BaseRepository;
import com.example.MarketApp.business.base.service.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class RecipeService extends BaseService<Recipe> {
    private final RecipeRepository recipeRepository;

    public RecipeService(RecipeRepository recipeRepository) {
        this.recipeRepository = recipeRepository;
    }

    public BaseRepository<Recipe> getRepository(){
        return this.recipeRepository;
    }

    public Recipe toEntity(RecipeDetailDto detailDto){
        if (detailDto == null) {
            return null;
        }

        Recipe entity = new Recipe();
        if (detailDto.getId() != null){
            Optional<Recipe> entityFound = this.recipeRepository.findById(detailDto.getId());
            if (entityFound.isPresent()){
                entity = entityFound.get();
            }
        }

        entity.setName(detailDto.getName());
        entity.setDescription(detailDto.getDescription());
        entity.setCalories(detailDto.getCalories());
        entity.setImage(detailDto.getImage());

        return entity;
    }

    public RecipeDetailDto toDetailDto(Recipe recipe){
        if (recipe == null) {
            return null;
        }

        RecipeDetailDto detailDto = new RecipeDetailDto();
        detailDto = setBaseDtoProperties(detailDto, recipe);
        detailDto.setName(recipe.getName());
        detailDto.setDescription(recipe.getDescription());
        detailDto.setCalories(recipe.getCalories());
        detailDto.setImage(recipe.getImage());

        return detailDto;
    }

    public List<Recipe> findAll(){
        List<Recipe> recipeList = this.recipeRepository.findAll();
        return recipeList;
    }

    public RecipeDetailDto saveOrUpdate(RecipeDetailDto detailDto){
        Recipe recipe = toEntity(detailDto);
        Recipe updatedOrSavedEntity = this.recipeRepository.save(recipe);
        return toDetailDto(updatedOrSavedEntity);
    }

    @Transactional
    public void deleteEntity(RecipeDetailDto detailDto){
        this.recipeRepository.deleteById(detailDto.getId());
    }
}
