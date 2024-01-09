package com.example.MarketApp.business.base.dto;

import jakarta.persistence.MappedSuperclass;

import java.time.LocalDate;
import java.util.Date;

@MappedSuperclass
public class BaseDetailDto {
    private Long id;
    private String createdBy;
    private LocalDate createdDate;
    private String lastUpdatedBy;
    private Date lastUpdatedDate;

    public BaseDetailDto() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public LocalDate getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDate createdDate) {
        this.createdDate = LocalDate.now();
    }

    public String getLastUpdatedBy() {
        return lastUpdatedBy;
    }

    public void setLastUpdatedBy(String lastUpdatedBy) {
        this.lastUpdatedBy = lastUpdatedBy;
    }

    public Date getLastUpdatedDate() {
        return lastUpdatedDate;
    }

    public void setLastUpdatedDate(Date lastUpdatedDate) {
        this.lastUpdatedDate = lastUpdatedDate;
    }
}
