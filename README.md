# Spring Project TeamB

## 

## Introduction

- spring framework 기반의 웹사이트 개발 (2차 프로젝트)

- 2021.09.23~2021.10.31

  

## Coding-Convention

- 명명 규칙

  - Java

    - 변수, 함수 : 카멜 케이스

    ```
    private TestService testService;
    private String tableName;
    public String getTableName() { return tableName; }
    ```

    - 상수 : 대문자 스네이크 케이스

    ```
    private final int MAX_COUNT = 10;
    ```

  - Database

    - 테이블, 뷰, 컬럼 : 소문자 스네이크 케이스

    ```
    table : free_board
    view : free_board_view
    column : no;
    column : member_no;
    ```

    - 컬럼의 접두어는 외부 테이블의 경우에만 사용하되, 줄여쓰지 않습니다.

    ```
    ex) table : board
    bno (X) -> no (O)
    board_no (X) -> no (O)
    mem_no (X) -> member_no (O)
    ```

## Encoding Type

- UTF-8
