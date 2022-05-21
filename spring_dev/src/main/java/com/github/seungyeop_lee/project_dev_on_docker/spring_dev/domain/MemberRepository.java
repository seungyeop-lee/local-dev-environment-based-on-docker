package com.github.seungyeop_lee.project_dev_on_docker.spring_dev.domain;

import org.springframework.data.repository.Repository;

public interface MemberRepository extends Repository<Member, Long> {
    Member save(Member member);
}
