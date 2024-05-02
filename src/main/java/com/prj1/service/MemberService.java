package com.prj1.service;

import com.prj1.domain.Member;
import com.prj1.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(rollbackFor = Exception.class)
@Slf4j
public class MemberService {

    private final MemberMapper mapper;

    public void signup(Member member) {
        mapper.insert(member);
        log.info("member={}", member);
    }

    public List<Member> list() {
        List<Member> list = mapper.selectAll();
        log.info("service.list={}", list);
        return list;
    }

    public Member get(Integer id) {
        return mapper.selectById(id);
    }

    public int delete(Integer id) {
        return mapper.deleteById(id);
    }
}
