package com.github.seungyeop_lee.project_dev_on_docker.spring_dev.command;

import com.github.seungyeop_lee.project_dev_on_docker.spring_dev.domain.Member;
import com.github.seungyeop_lee.project_dev_on_docker.spring_dev.domain.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
public class MemberService {
    private final MemberRepository memberRepository;

    public Member saveMember(String name) {
        return memberRepository.save(Member.of(name));
    }
}
