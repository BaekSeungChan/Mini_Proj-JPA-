package com.example.miniproj2.repository;

import com.example.miniproj2.entity.Board;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BoardRepository extends JpaRepository<Board, Long> {

    // 목록 최신순 번호 내림차순
    Page<Board> findAllByOrderByIdDesc(Pageable pageable);

    // 제목을 포함하는 게시글 검색
    Page<Board> findAllByTitleContaining(String title, Pageable pageable);

    // 내용을 포함하는 게시글 검색
    Page<Board> findAllByContentContaining(String content, Pageable pageable);

    // 작성자를 포함하는 게시글 검색
    Page<Board> findAllByWriterContaining(String writer, Pageable pageable);

}
