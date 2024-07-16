package com.boot.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FilterController {

    @PostMapping("/filter")
    public List<String> filter(@RequestBody Map<String, List<String>> params) {
        List<String> options = params.get("options");

        // 예시 데이터
        List<String> allItems = Arrays.asList();//???????

        // 필터링 로직을 구현하여 결과 리스트를 반환
        List<String> filteredList = getFilteredList(allItems, options);

        return filteredList;
    }

    private List<String> getFilteredList(List<String> allItems, List<String> options) {
        List<String> filteredList = new ArrayList<>();

        for (String item : allItems) {
            boolean matches = true;

            for (String option : options) {
                if (!item.contains(option)) {
                    matches = false;
                    break;
                }
            }

            if (matches) {
                filteredList.add(item);
            }
        }

        return filteredList;
    }
}