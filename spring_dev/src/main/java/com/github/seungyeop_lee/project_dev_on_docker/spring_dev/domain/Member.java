package com.github.seungyeop_lee.project_dev_on_docker.spring_dev.domain;

import lombok.Getter;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

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
