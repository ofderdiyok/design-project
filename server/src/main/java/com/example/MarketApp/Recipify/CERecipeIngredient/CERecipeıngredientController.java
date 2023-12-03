package com.example.MarketApp.Recipify.CERecipeIngredient;

import com.example.MarketApp.Recipify.CERecipeIngredient.dto.CERecipeIngredientDetailDto;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/ceRecipeIngredient")
public class CERecipeıngredientController {
    private final CERecipeIngredientService ceRecipeIngredientService;


    public CERecipeıngredientController(CERecipeIngredientService ceRecipeIngredientService) {
        this.ceRecipeIngredientService = ceRecipeIngredientService;
    }

    @GetMapping("/list")
    public List<CERecipeIngredient> findAll(){
        List<CERecipeIngredient> ceRecipeIngredientList = this.ceRecipeIngredientService.findAll();
        return ceRecipeIngredientList;
    }

    @PostMapping("/save")
    public CERecipeIngredientDetailDto saveEntity(@RequestBody CERecipeIngredientDetailDto detailDto){
        CERecipeIngredientDetailDto savedEntityToDetailDto = this.ceRecipeIngredientService.saveOrUpdate(detailDto);
        return savedEntityToDetailDto;
    }

    @DeleteMapping("/delete")
    public ResponseEntity<Void> deleteEntity(@RequestBody CERecipeIngredientDetailDto detailDto){
        this.ceRecipeIngredientService.deleteEntity(detailDto);
        return ResponseEntity.noContent().build();
    }
}
