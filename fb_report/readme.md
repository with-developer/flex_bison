# [AntiVirus] 수식계산기에 종료 키워드 추가하기


- 강의: S-dev AntiVirus<br>
- 마감일: July 31, 2023<br>
- 상태: 완료<br>
- 유형: 과제<br><br>

### Task

```
Flex, Bison 으로 변수, 함수 선언과 정의, 참조가 가능한 수식계산기에 종료 명령어가 없다.
첨부된 소스코드를 다운로드 받고 수정하여, 종료 명령어 quit 를 입력하면 프로세스를 종료하도록 기능을 추가하여라.
```
<br>

### Code

[ac.l Link](https://github.com/with-developer/flex_bison/blob/main/fb_report/ac.l)(add 39 Line)
```
/* ac.l File */
...
"quit"  { quit(); }
...
```
<br>

[acnf.c Link](https://github.com/with-developer/flex_bison/blob/main/fb_report/acfn.c)(add 377~380 Line)

```
/* acfn.c FILE */
...
void quit(){
	printf("This program is exit!\n");
	exit(0);
}
...
```

### RUN
```bash
$ make
$ ./ac.exe
> quit
```
<br>

### Result

> quit 명령어 실행 결과
> ![image](https://concise-egg-c3d.notion.site/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F1bd75eab-1a0b-4821-8b87-8aecc5895312%2FUntitled.png?table=block&id=050898af-a163-4af6-9714-ca17f53e3bae&spaceId=cdedcb90-4171-4218-866c-2193f2353645&width=1640&userId=&cache=v2)
>
