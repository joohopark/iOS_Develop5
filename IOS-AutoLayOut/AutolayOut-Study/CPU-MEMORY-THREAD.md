# CPU, Core, Memory, Thread, GCD, GUI..

---

## CPU

- CPU(Central Processing Unit) 중앙 처리 장치를 의미한다

---

## Clock 
 
컴퓨터에 있는 모든 데이터는 이진수로 처리되므로, 어떤 데이터라 할지라도 CPU는 수많은 0과 1로 이루어진 데이터를 연산하여 다양한 결과를 도출한다. 즉, 컴퓨터 내부에서 이동하는 데이터는 0과 1로만 구성된 디지털 신호의 조합이다.

![screen](/study/image/CPU0.png)

---

## CPU 외/내 형 

| 외형 | 내형 |
| :---: | :---: | 
| ![screen](/study/image/CPU.png) | ![screen](/study/image/CPU-1.png) |


	


---

## CPU 구조

![screen](/study/image/CPU-2.png)

* fetch  <br>
	- 실행할 인스트럭션을 <br>
	- 메모리에서 인스트럭션 레지스터로 이동 <br>
* decode  <br>
	- CU 에서 인스트럭션을 해석<br>
* execution <br>
	- 해석된 인스트럭션을 실행 <br>


---

## CPU, Core, Thread

![screen](/study/image/CPU-3.png)

```
Cpu{ Core { 
		Thread, Thread1, Thread2....} 
		
		Core1 {
		Thread, Thread1, Thread2... }
		
		}
``` 

- Core 는 Os에 의해서 되어 지는데, CPU 속에 하나의 Core가 연산을 유지합니다. <br>
- 여러개의 Core가 동시에 작업하는것 같지만 CPU는 한번에 하나의 Core 연산을 유지 할수 있습니다. <br>


| 코어당 쓰레드 | 예시 | 가능 유무 |
| :---: | :---: | :---: |
| 코어4 쓰레드 4 | 책상 4개 | 공간 4개나옴 |
| 코어 4 쓰레드 8 | 책상 4개 칸막이 4개 | 공간 8개 나옴 |
| 코어 6 쓰레드 4 | 공간 x |  불가능 |



[What is the difference between a ‘Thread’ and a ‘Core’?](https://bitsum.com/tips-and-tweaks/what-is-the-difference-between-a-thread-and-a-core/)



---

## Hyper-Threading Technology


| 일반 | hyper-Threading |
| :---: | :---: | 
| ![screen](/study/image/CPU-4.png) | ![screen](/study/image/CPU-5.png) |


하이퍼스레딩(Hyper-Threading Technology, 이하 HTT)은 인텔이 동시 멀티스레딩을 구현한 기술이다. 물리상 실행 장치 한 개에 가상 실행 장치 두 개를 할당해 성능을 높이려는 기술이다. 운영 체제는 코어 한 개당 스레드가 두 개씩 추가돼 싱글 코어(1개)는 듀얼 코어(2개), 듀얼 코어(2개)는 쿼드코어(4개), 쿼드코어(4개)는 옥타코어(8개), 옥타코어(8개)는 헥사 데시멀 코어(16개) 가 장착 되어있다고 인식한다.


- 맥에서 CPU 확인하기 <br>

```
sysctl -n machdep.cpu.brand_string
```

- 맥에서 CPU CORE 개수 확인하기 <br>

```
sysctl hw | grep cpu
```

**하이퍼 스레딩을 사용한다고 해서, 연산속도가 2배 4 배 8배... 이렇게 증가 하지는 않습니다. 하이퍼 스레딩을 사용하면 통상적으로 15% 정도 성능 향상이 있다고 합니다.**
---

## Thread 

![screen](/study/image/CPU-7.png) 

* Process <br>
	- 프로세스 : 메모리 상에서 실행되는 프로그램 -> 완전히 독립적인 메모리를 가집니다.

* Thread <br>	
	- 스레드 : 데이터 내의 실행 흐름 단위 -> 데이터, 힙, 코드 영역을 공유 합니다 

이로인해서 `Critical Section` 이 생기고, 이로 인해서 `Race Condition`이 발생합니다

#### - Race condition

공유 자원을 가지고, CPU 가 서로 사용하기 위해 CPU 권한을 뺴앗는것, 수행해야 하는 연산을 하기전에, CPU 권한이 넘어가 버려서, 해야할 수행을 하지 못하게 되는 현상이 발생함... 그것에 대한 대안으로 mutual exclusion 발상을 하게 됨.

#### - 



---



## Cache

![screen](/study/image/CPU-6.png)

위로 갈수록 용량은 커지고, 속도는 느려지고, 가격도 저렴해집니다.
















---


- 리눅스 CPU 개념 확인하기 좋은 예시 
http://zetawiki.com/wiki/리눅스_CPU_개수_확인





-
- 물리적 스레드, 하이퍼스레드(가상 스레드)
가상 스레드는 물리적 스레드보다 성능이 떨어짐. 근데 없는것보다는 낫다

인텔 제품끼리보더라도 i5와 i7의 차이가 결국 하이퍼쓰레딩으로 인해 가상코어4개가 더 있냐없냐의 차이인데 이것이 일반적인 인코딩이나


- 하이퍼 스레딩에 대한 자세한 설명
https://nbamania.com/g2/bbs/board.php?bo_table=freetalk&wr_id=1332997

- 4코어, 1 스레드 
과거에는4코어4쓰레드처럼1코어당 1쓰레드로 데이터를 처리했다. 코어를 회사에 있는 하나의 훌륭한 인재라고 한다면, 인재가 회사의 업무를 처리하는 방식이 한 가지인 것이다. 즉, 1코어가 데이터를 처리할 때 하나의 길로 송신하고 수신하고 하는 것이다. 그러나 요즘은 4코어8쓰레드처럼 1코어당2쓰레드로 데이터를 처리한다. 즉 송신하고 수신하는 길이 다른 것이다.

2코어 4쓰레드, 4코어 8쓰레드처럼 1코어당 2쓰레드란 개념은 CPU 최적화를 위해 만들어진 것으로 실제 성능이 15%정도 향상된다고 한다.


- CPU 성능 환산

 CPU
 
- 
 
 
 
▶ CPU의 연산 속도, 클럭
 
- 컴퓨터에 있는 모든 데이터는 이진수로 처리되므로, 어떤 데이터라 할지라도 CPU는 수많은 0과 1로 이루어진 데이터를 연산하여 다양한 결과를 도출한다. 즉, 컴퓨터 내부에서 이동하는 데이터는 0과 1로만 구성된 디지털 신호의 조합이다.
 
- 이러한 디지털 신호를 빠르게 처리하는 연산 속도는 CPU마다 다르다. 속도를 나타내는 대표적인 단위는 클럭(Clock)이다. 클럭이란 1초당 CPU 내부에서 몇 단계의 작업이 처리되는 지를 측정하여 주파수 단위인 헤르츠(Hz)로 나타낸 것이다. 즉, 이 클럭 수치가 높을수록 빠른 성능의 CPU라고 볼 수 있다. 예를 들어 인텔 코어(Core) i7 4790K라는 제품의 CPU는 클럭이 4GHz인데, 이는 1초에 약 40억개의 작업이 처리됨을 의미한다. 


하이퍼 스레딩은, 코어를 세분화 한다기 보다는 한코어에서 두개 이상의 쓰레드가 돌아가는 경우에 쓰레드 전환의 오버헤드를 줄여주는 기능을 합니다. 새로운 자원을 만들어 내는것이 아니기 때문에 원래 코어에 여유가 있을 때만 성능 향상 효과가 잇고, 코어가 100퍼센트로 차 있는 상황에서는 성능 향상이 없거나 오히려 성능이 저하될 수도 있습니다.


- CPU strees test & 확성상태로 thread 확인


- thread 생성, 활성상태 에서 확인가능
```
yes > /dev/null &
```

- 생성된 thread 삭제

```
$ killall yes
```



