# 17_10-28

---

## Github 특강

---

IT 회사에서 일해보지 않은 사람이 `github 으로 협업하기` 라는 키워드를 가지고 구글링해서 정리한 내용입니다.  

---

## 개발자의 하루 

같이 일하는 사람들 : IOS,디자이너,기획자, 영업, 경영 등등.. 

#### * S/W 개발자란 무엇인가?

컴퓨터 소프트웨어의 연구, 설계, 프로그래밍 및 테스트를 포함하여 소프트웨어 개발 프로세스의 측면에 관심이 있는 사람


시스템 설계+소프트웨어 개발 및 프로그래밍 



#### 개발자로서 어떤 생각을 가지고 있는가?

1. 개발자는 끊임없이 공부해야 한다. <br>
2. 현재 개발자, 현업개발자도 계쏙 공부하여야지 되는 노력이 필요한 분야 <br>
3. 한가지를 깊게 아는것 보다는 빠르게 습득할 수 있는 것이 능력은 회사에서 중요하게 요구하는 능력인것 같다 <br>

> 개인적인 생각으로 `좋은 개발자`란, 함께 일하고 싶은사람 이 아닐까 하고 생각합니다. 아, 저분 하고 한번 같이 작업 해보고 싶다. 라는 생각을 떠올리게 만드는 개발자가 `좋은 개발자` 라고 생각합니다.
> 
> 그럼 어떤 사람들이 그런 생각을 하게 만들까 고민 해보면, 배울점이 있는분(포괄적인 의미에서), 열정적이고, 무언가를 시작하면 즐기는분...등등 이유는 많이 있는것 같습니다. 본질적으로 함께 했을때 즐거울것 같은 사람이 진짜 좋은 개발자가 아닐까...하고 그냥 생각해봅니다. 
>
>
> 장인수 개발자님은. 
> 개발자가 회사를 `직장` 으로 생각하느냐, `직업` 으로 생각 하느냐에 차이도 크고, 개인의 성장과 회사의 성장 사이의 벨런스가 잘 맞는 것도 중요하다고 얘기 하시네요..! 
> 
> 개발자는 기본적으로 성장 하는 사람인것 같습니다. 

---

## Git을 이용한 협업 Workflow 

1. Centralized Workflow

2. Feature Branch Workflow

3. Gitflow Workflow

4. forking workflow

---

## 1. Centralized Workflow


![screen](/study/image/gitworkflow.jpg)

Git으로 협업 환경을 전환하는 것은 굉장히 어려워 보이지만, 지금 소개하는 Centralized Workflow는 사실 기존의 Subversion(SVN)으로 협업할 때와 크게 다를 바 없다. <br>

SVN에 비하면 Git은 다음 장점이 있다. 첫째, 모든 팀 구성원이 로컬 저장소를 이용해서 개발한다는 점이다. 로컬 저장소는 중앙 저장소로 부터 완벽히 격리된 상태이므로, 다른 팀 구성원 및 중앙 저장소의 변경 내용을 신경 쓰지 않고 자신의 작업에만 집중할 수 있다. <br>

둘째, Git의 브랜치와 병합 기능의 이점을 들 수 있다. Git 브랜치를 이용하면 안전하게 코드를 변경하고 다른 브랜치에 통합할 수 있다.

> 중앙 저장소는 한개로 두고, 작업자들 각각 중앙 저장소의 내용을 받아서, 작업 -> push 순으로 작업을 합니다. 이때 각자 작업의 시점차이 때문에 충돌이 발생할수 있는데, 이때는 중앙 저장소에서 push 를 받아주지 않습니다. 그때는 현재 작업한것과, 중앙 저장소의 내용을 pull 한후, merge 하여 다시 push 해줍니다.
> 
> 형상관리의 발전 순서가, CVS->CSN 이라고 합니다.

---

## 2. Feature Branch Workflow

![screen](/study/image/gitworkflow-1.jpg)

Feature Branch Workflow의 핵심 컨셉은 기능별 브랜치를 만들어서 작업한다는 사실이다. 기능 개발 브랜치는 격리된 작업 환경을 제공하기 때문에 다수의 팀 구성원이 메인 코드 베이스(master)를 중심으로 해서 안전하게 새로운 기능을 개발할 수 있다. 따라서 master 브랜치는 항상 버그 프리 상태로 유지할 수 있어, 지속적 통합(Continuout Integration)을 적용하기도 수월하다. 또, 풀 리퀘스트를 적용하기도 쉽다. <br>

> 기능별로 branch 를 만들어서, 통합하기전 `pull requests` 하여 안전하게 중앙 저장소에서 merge 하며 개발합니다.
> 
> 작동원리는 Gitflow Workflow도 팀 구성원간의 협업을 위한 창구로 중앙 저장소를 사용한다. 또 다른 워크플로우와 마찬가지로 로컬 브랜치에서 작업하고 중앙 저장소에 푸시한다. 단지 브랜치의 구조만 다를 뿐입니다.
> 
> 


---

## 3. Gitflow Workflow

![screen](/study/image/gitworkflow-2.jpg)

> Gitflow Workflow는 코드 릴리스를 중심으로 좀 더 엄격한 브랜칭 모델을 제시한다. Feature Branch Workflow보다 복잡하긴하지만, 대형 프로젝트에도 적용할 수 있는 강건한 작업 절차다.
> 
> 작동 원리 는 Gitflow Workflow도 팀 구성원간의 협업을 위한 창구로 중앙 저장소를 사용한다. 또 다른 워크플로우와 마찬가지로 로컬 브랜치에서 작업하고 중앙 저장소에 푸시한다. 단지 브랜치의 구조만 다를 뿐이다.
> 
> Gitflow는 크게 `Develop`,`Release` 브랜치를 사용한다. Develop 은 항상 최신의 상태로 유지하고, 각각 개발완료 버전에 따라서 Release에서 v.1 - v.1.1 - v.1.2... 로 나 눠지면서 관리되어집니다.


---


## 4. Forking Workflow

 OpenSource 에서 가장 많이 사용하는 방식 입니다. 누군가 만들어 놓은 repo를 fork 떠가고 난후, 수정, 보완 사항을 pull requests 해서 반영할수 있는 방식입니다. 
 
 
---

## Github 명령어.ㅎ

1. <br>

```swift
git checkout -b feature/mento
```

> 현재 내가 사용하는 repo에 feature/mento 라는 brnach 가 없으면 생성하고, 그 브랜치로 시점을 이동 합니다.

2. <br>

```swift
git remote -v
```
> push 할때 origin 명령어를 사용해야 하는 이유는, `git remote -v`를 작성해보면, 현재 Repo 가 `origin`을 지칭 하고 있습니다. 

3. <br>


```siwft
git fetch ...
```

> fetch 와 pull 의 차이는, fetch 는 그 brnach 의 정보들만 가져오고 merge 하지는 않습니다. pull은 현재 로컬의 데이터와, pull 하려고 하는 branch 의 정보들을 merge 합니다

4. <br>

```swift
git branch -a
```

> 모든 brnach 의 목록을 볼수 있습니다. 
> 이때 원격에서 `git fetch`를 현재 원격에 등록되어 있는 brnach 목록들을 모두 가져올수 있습니다. 사실 정석으로 명령어를 작성하자면 `git fetch origin` 이지만 defults 값인 origin 은 생략해주어도 가능합니다(?)

4. <br>

```
merge PR(pull requests) 
```

---

## Refrence 

[appkr.memo 님 blog](http://blog.appkr.kr/learn-n-think/comparing-workflows/)
