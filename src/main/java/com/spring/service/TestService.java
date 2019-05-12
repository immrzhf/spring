package com.spring.service;

import com.spring.dao.TestMapper;
import com.spring.model.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class TestService {

    @Autowired
    private TestMapper testMapper;

    public Test getUserById(String id) {
        return testMapper.selectByPrimaryKey(id);}

    public List<Map<String, Object>> getGoodsList() {
        return testMapper.getGoodsList();
    }
}
