package com.example.miniproj2.repository;

import com.example.miniproj2.entity.Board;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BoardRepository extends JpaRepository<Board, Long> {

    // 목록 최신순 번호 내림차순
    List<Board> findAllByOrderByIdDesc();

    // 제목을 포함하는 게시글 검색
    List<Board> findAllByTitleContaining(String title);

    // 내용을 포함하는 게시글 검색
    List<Board> findAllByContentContaining(String content);

    // 작성자를 포함하는 게시글 검색
    List<Board> findAllByWriterContaining(String writer);

}
