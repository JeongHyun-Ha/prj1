package com.prj1.service;

import com.prj1.domain.Board;
import com.prj1.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(rollbackFor = Exception.class)
public class BoardService {

    private final BoardMapper mapper;

    public void add(Board board) {
        mapper.insert(board);
    }

    public Board getBoard(Integer id) {
        return mapper.selectById(id);
    }

    public List<Board> list() {
        return mapper.selectByAll();
    }

    public int delete(Integer id) {
        return mapper.deleteById(id);
    }

    public void update(Board board) {
        mapper.updateById(board);
    }
}
