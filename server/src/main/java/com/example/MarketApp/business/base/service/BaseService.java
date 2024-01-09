package com.example.MarketApp.business.base.service;

import com.example.MarketApp.business.base.dto.BaseDetailDto;
import com.example.MarketApp.business.base.entity.BaseEntity;
import com.example.MarketApp.business.base.repository.BaseRepository;

public abstract class BaseService <E extends BaseEntity>{
    public abstract BaseRepository<E> getRepository();

    protected <B extends BaseDetailDto> B setBaseDtoProperties(B dto, E entity){
        dto.setId(entity.getId());
        dto.setCreatedBy(entity.getCreatedBy());
        dto.setCreatedDate(entity.getCreatedDate());
        dto.setLastUpdatedBy(entity.getLastUpdatedBy());
        dto.setLastUpdatedDate(entity.getLastUpdatedDate());
        return dto;
    }
}
