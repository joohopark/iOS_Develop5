# 17.9.5

# 컴퓨터 프로그램이란, 컴퓨터 작동원리 
--- 

## 프로그램이란 
 - 프로그램 vs 프로세스 <br>
	 - 프로그램 : 현재 hard disk에 저장 되어있는 code, data, heap, stack
	 - 프로세스 : 현재 runing 중인 녀석. ex) 메모장 2개 키면, hard disk에 있는 메모장은 프로그램, 현재 실행 중인 메모장 2개는 프로세스 2개.
   
---

## 컴퓨터 작동원리
 - 컴퓨터 구성요소 : 하드웨어, 소프트웨어 
     하드웨어 : 중앙처리장치, 기억장치, 입력장치, 출력장치
     소프트웨어 : 시스템 소프트웨어, 응용 소프트웨어

 - 운영체제(Operation System) : 시스쳄 하드웨어를 관리할뿐 아니라, 응용 소프트웨어를 실행하기 위하여 하드웨어 추상화 플랫폼과 공통 시스템 서비스를 제공하는 시스템 소프트웨어.( 사용자 > 응용 프로그램 > 운용체제 > 하드웨어 / 하드웨어 > 운영체제 > 응용 프로그램 > 사용자) -> 하드웨어와 실제 실행되는 프로그램 사이의 추상적인부분(기계어 번역등)을 OS 가 사람이 알기 쉽게 변경시켜줌.
 
- CPU 동작원리 내부구조 <br>
	- 시스템 버스 데이터 통신방법 <br>
	- ALU, PC, CU, register, fetch, decode, execution  <br>
	- 메모리에 데이터가 저장 될때, 저장된 데이터가 꺼내어져서 사용될때 차이(heap, stack) <br>
	- 가상 메모리 원리 page, page fream, page table, page fault 
	- cache, locality, cache hit, cache miss, temporal locality, spatial locality 

---

## 저급언어, 고급언어
 - 저급언어 
    1. 기계어 : 0과1로 된 이진수 형태, 컴퓨터가 직접 이해함
    2. 어셈플리어 : 기호로 나타낸언어, code -> 어셈플리어 -> 기계어
      -> 저급언어 장점은 하드웨어에 직접작용해서 속도 빠름. 단점은 코드 짜기 매우 힘듬

 - 고급언어
    1. 파이썬..c 등등.. 개발자가 쉽게 개발할수 있는 기호로 작성할수 있게 도와줌
       -> 추상화 되어있음. 기계어에서 당연한 내용들을 생략 시켜서, 인간에 가까운 언어로 만들었는데, 점점 기계어 영역과는 멀어지고있음.

---

## 컴파일 언어
 - 컴파일: 사람이 이해할수 있는 언어를 기계언어로 변환 시키는 작업. 고급언어 -> 기계어
 -  종류: C, java, objective-C, swift 
 -  특징 : 실행속도가 빠름. 이유는 미리 컴파일을 완료시킨 이후. 다른 코드들 작업이 진행됨, 안전하게 사용가능하다는 이야기임. 컴파일 과정에서 문제가 있으면 다시 뜯어 고쳐야 하는데, 이미 그 과정이 완료된 단계

---

## 스크립트 언어
 - 인터프리터 언어 : 명령어들을 한줄씩 읽어 들여서 실행하는 프로그램
 - 종류 : html, javascrip, php, python..
 - 특징 : 실행 속도 느림, 컴파일을 미리 하지 않기 때문에 사전에 디버깅 힘듬. 처음에 source 와 code 가 input, output 이 컴파일 언어랑 다름.

---

## Reference 

[Floating Point Number](https://devminjun.github.io/blog/floating-point-number)<br>
[ASCII-UNICODE](https://devminjun.github.io/blog/ACSII-UNICODE)<br>
[How to work CPU](https://www.youtube.com/watch?v=cNN_tTXABUA&t=1117s)
