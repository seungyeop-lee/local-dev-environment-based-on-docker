package com.github.seungyeop_lee.project_dev_on_docker.spring_dev.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Getter;

@Entity
@Getter
public class Member {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    public static Member of(String name) {
        Member result = new Member();
        result.name = name;
        return result;
    }
}
