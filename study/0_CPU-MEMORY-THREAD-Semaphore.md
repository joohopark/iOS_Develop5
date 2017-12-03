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

```swift

** 일반 적인 경우

import UIKit

class ViewController: UIViewController {
    
    var globalCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0...10000 {
            self.globalCount += 1

            self.globalCount += 1
        }
        print(globalCount) // 20002
     }

** Race condition 이 발생하지 않는 경우 


	let q = DispatchQueue.main.async {
            for _ in 0...10000 {
                self.globalCount += 1
                print("\(self.globalCount) in q")
                
                let qq = DispatchQueue.main.async {
                    self.globalCount += 1
                    print("\(self.globalCount) in qq")
                }
            }
        }
        print(self.globalCount) // 20002
        

** Race Condition 발생하는 경우 

let semaphore = DispatchSemaphore(value: 1)
        
        
        let q = DispatchQueue.global().async {
            for _ in 0...10000 {
                self.globalCount += 1
                print("\(self.globalCount) in q")
            }
        }
        
        let qq = DispatchQueue.global().async {
            for _ in 0...10000 {
                self.globalCount += 1
                print("\(self.globalCount) in qq")
            }
            
        }
        self.globalCount 에서 Race Condition 이 발생해서, globalCount가 목표값 까지 도달 하지 못함.
        
** Race Condition 방지

        
        let semaphore = DispatchSemaphore(value: 1)
        
        
        let q = DispatchQueue.global().async {
            for _ in 0...10000 {
                semaphore.wait()
                self.globalCount += 1
                semaphore.signal()
                
                print("\(self.globalCount) in q")
                
            }
        }
        
        let qq = DispatchQueue.global().async {
            
            for _ in 0...10000 {
            
                semaphore.wait()
                self.globalCount += 1
                semaphore.signal()
                print("\(self.globalCount) in qq")   
            }   
        }
        > siginal 형식을 통해서, globalCount에 접근할때 접근하는 count를 막아줍니다
```

---

## 여담

CPU strees test 하는 방법!

- 터미널에서, thread 생성, 활성상태 에서 확인가능합니다

```
yes > /dev/null &
```

- 생성된 thread 삭제

```
$ killall yes
```
---




