# **CEA201 SPRING22**
# **ASSEMBLY ASSIGNMENT**

**Student:**

- Pham Quoc Trung
- HE171493
- IA1701

**Used Language:**

- Assembly x86 (Solution 1)
- C (Solution 2)

**Problem Solving:**

1/ Problem 1:

Print **&quot;Hello world&quot;** to the console

- Solution 1:
```assembly
org 100h

jmp start

        msg:    db      "Hello world$"

start:  
        
        mov     dx, msg
        mov     ah, 09h 
        int     21h 
        
        
ret 
```

- Solution 2:
```c
#include <stdio.h>

int main()
{
    printf("Hello world");

    return 0;
}
```

- Test case:

![image](https://user-images.githubusercontent.com/86862725/159131902-2ac69769-9edc-44d0-8d20-da154a3aa7f3.png)

2/ Problem 2:

Given two numbers a, b

**Print:** a+b, a-b, a\*b, a/b ( quotient and reminder)

**Example:** a = 2, b = 1

**Output:**

a + b = 3, a-b = 1, a\*b = 2, a/b = 2, reminder 0

- Solution 1:
```assembly
include 'emu8086.inc'
org 100h
jmp start

    num_a dw ?
    num_b dw ?

start:


    call SCAN_NUM   ;luu vao CX
    mov num_a, cx
    PRINT 10        ;newline
    call SCAN_NUM
    mov num_b, cx
    PRINT 10
    PRINT 10
    
    mov ax, num_a
    mov bx, num_b
    add ax, bx
    PRINT 'a+b='
    call PRINT_NUM    ;in ra tu AX
    PRINT ', '
    
    mov ax, num_a
    mov bx, num_b
    sub ax, bx
    PRINT 'a-b='
    call PRINT_NUM
    PRINT ', '
    
    mov ax, num_a
    mov bx, num_b
    mul bx
    PRINT 'a*b='
    call PRINT_NUM_UNS
    PRINT ', '
                  
    mov ax, num_a
    mov bx, num_b
    cmp bx, 0
    je ERROR
    div bx
    PRINT 'a/b='
    call PRINT_NUM
    PRINT ', reminder '
    mov ax, dx
    call PRINT_NUM
    jmp end 
    ERROR: PRINT 'a / b doesnt exist, reminder doesnt exist'
    
     
end:
RET 
DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PTHIS
DEFINE_GET_STRING
DEFINE_PRINT_STRING
END 
```

- Solution 2:
```c
#include <stdio.h>

int main()
{
    int a, b;

    scanf("%d%d", &a, &b);

    printf("a + b = %d, ", a+b);
    printf("a - b = %d, ", a-b);
    printf("a * b = %d, ", a*b);
    if(b==0)
    {
        printf("a / b doesn't exist, ");
        printf("reminder doesn't exist, ");
    }
    else
    {
        printf("a / b = %d, ", a/b);
        printf("reminder %d", a%b);
    }
    return 0;

}
```

- Test case:

a = 10, b = 5

![image](https://user-images.githubusercontent.com/86862725/159131962-240a9d2b-02bc-47a3-86c2-cc66aa754560.png)

a = 5, b = 10

![image](https://user-images.githubusercontent.com/86862725/159131976-9a8b0697-83fc-4c36-b37b-7c1650e44e4b.png)

a = 1, b = 1

![image](https://user-images.githubusercontent.com/86862725/159132000-1df4db24-d455-4eec-85ec-d90250957659.png)

a = 10, b = 0

![image](https://user-images.githubusercontent.com/86862725/159132017-4a2f62dc-9061-4b2c-989d-21f799ea89f8.png)

a = 255, b = 256

![image](https://user-images.githubusercontent.com/86862725/159132035-e20be3a0-3031-40b5-a277-8b38a594a62e.png)

3/ Problem 3:

Input number x:

- Print the digits of x

- Print sum of digits

**Required:** Enter valid value 0 \&lt;= x \&lt;= 65,535

**Example:** x = 12345

**Output:**

1, 2, 3, 4, 5.

15

- Solution 1:
```assembly
include 'emu8086.inc'
org 100h
jmp start
    ar dw 100 dup(?)
    c dw 0   ; c = count
    sum dw 0
    
start:

    call SCAN_NUM
    cmp cx, 10
    jl zero
    PRINT 10
    PRINT 10
    mov si, 0
    mov ax, cx
    mov bx, 10
    
    do:
        xor dx, dx   ;xoa thanh ghi dx
        div bx       ;chia cho 10
        inc c
        push dx      ;day vao stack
        cmp ax, 0    ;chia den khi ax = 0
    jne do
        
    do1:
        pop dx              ;lay dx ra khoi stack
        mov ax, dx          ;gan vao AX de in ra dc
        call PRINT_NUM      
        PRINT ', '
        dec c
        add sum, ax
        cmp c, 1      ;ko pop het vi can dau . o cuoi
    jne do1
    
    pop dx             
    mov ax, dx
    add sum, ax
    call PRINT_NUM    
    PRINT '.'
    
    PRINT 10
    PRINT 13            ;lui ve dau dong
    mov ax, sum
    call PRINT_NUM
    jmp end
    
    zero:
    PRINT 10
    PRINT 10
    mov ax, cx
    call PRINT_NUM
    PRINT '.'
    PRINT 10
    PRINT 13
    call PRINT_NUM        
              

end:
RET
DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PTHIS 
DEFINE_GET_STRING
DEFINE_PRINT_STRING
END
```
- Solution 2:

```c
#include <stdio.h>

int main()
{
    int x, t[20], i = 1, n, sum = 0;

    scanf("%d", &x);

    while (x != 0)
        {
            t[i] = x%10;
            i++;
            x = x/10;
        }
    n = i -1;
    
    printf("\n");
    for(i = n ; i > 1; i--)
        printf("%d, ", t[i]);
    printf("%d.", t[1]);
    for(i = n; i > 0; i--)
        sum += t[i];
    printf("\n%d", sum);
    
}

```

- Test case:

x = 0

![image](https://user-images.githubusercontent.com/86862725/159132049-6e928d77-c752-48e7-94f2-1af45c574ec1.png)

x = 255

![image](https://user-images.githubusercontent.com/86862725/159132063-07b8644f-ad79-48e7-b4d6-66ff3243e83a.png)

x = 256

![image](https://user-images.githubusercontent.com/86862725/159132082-5e03d192-87fc-474a-a6dc-466dfe22208b.png)

4/ Problem 4:

**Calculate:**

F5 = 0;

for(int i = 0; i \&lt;= 12; i++ )

for(int j = i; j \&lt;= 10; j++ )

F5 += (i+j);

**Required:**

Use **LOOP** and **CX** register

- Solution 1:
```assembly
include 'emu8086.inc' 
org 100h

mov ax, 0           ;F5 = 0
mov cx, 12          ;i <= 12
 
k1: 
  
    mov bx, cx        ;j=i
    push cx           ;dua vao stack
    mov cx, bx        
    
    k2: 
    
    cmp bx, 10          
    jg stop
    add ax, bx          ;F5 += (i+j)
    add ax, cx
         
         
    loop k2
     
    add ax,bx            ;phai them cai nay vi khac vs C, khi CX = 0 thi cai nay ko chay nua
    stop: pop cx 
    
loop k1

call PRINT_NUM

Ret
DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
END
```

- Solution 2:
```c
#include <stdio.h>

int main()
{
    int F5, i, j;
    F5 = 0;

    for(i = 0; i <= 12; i++ )
        for(j = i; j <=10; j++ )
            F5 += (i+j);
        
    printf("%d", F5);

    return 0;

}
```
- Test case:

![image](https://user-images.githubusercontent.com/86862725/159132115-06f61d65-a943-4cc3-8437-3b86b472b8aa.png)

5/ Problem 5:

Enter a string from keyboard, limited 255 characters

Save content to file **README.md** (..\emu8086\MyBuild)

- Solution 1:
```assembly
org 100h
jmp start
    file db 'README.md', 0  
    handle dw ?             ;temp file? idk 
    str db 256 dup('$')
start:
    
    mov ah, 3ch
    lea dx, file
    mov cl, 0               ;tao file README.md
    int 21h                 ;File se dc luu o ..\emu8086\MyBuild
    mov handle, ax
    
    mov ah, 3Dh
    lea dx, file
    mov al, 1               ;chi cho phep ghi  
    int 21h
    mov handle, ax
    
    mov si, 0
    mov cx, 0
    
    get_str:          
        mov ah, 1
        int 21h
        cmp al, 13          ;13 chu kp 10 vi khi enter con tro se ve dau dong
        je end
        mov str[si], al
        inc si
        inc cx              ;giup in vua du so ki tu da nhap
        jmp get_str
    end:
    
    mov ah, 40h
    mov bx, handle
    lea dx, str             ;lea thi 16 bit + 8 bit cx dc
    int 21h
    
    mov ah, 3eh
    mov bx, handle          ;dong file
    int 21h
   

ret
```
- Solution 2:
```c
#include <stdio.h>

int main()
{
    char str[256];

    FILE *f;
    f=fopen("README.md", "w");

    scanf("%[^\n]", str);
    
    fprintf(f, "%s", str);

    fclose(f);
    return 0;

}
```
- Test case:

&quot;CEA201&quot;

![image](https://user-images.githubusercontent.com/86862725/159132142-a4798adb-5c16-4782-8dee-0d00d7a1728e.png)

![image](https://user-images.githubusercontent.com/86862725/159132148-9dab1f0a-0d5f-4e35-8811-1caefa2df15f.png)


&quot;A palindrome is a word, number, phrase, or other sequence of

characters which reads the same backward as forward, such as madam

or racecar.&quot;
![image](https://user-images.githubusercontent.com/86862725/159132154-664e2ec5-97e3-4bff-b363-e57cdb05b208.png)

![image](https://user-images.githubusercontent.com/86862725/159132164-55673a57-aacc-4802-8400-2c4406bd10ac.png)

6/ Problem 6:

Print contents in **README2.md** file

- Solution 1:

_Note: Using this solution, It is required to copy the README2.md to ..\emu8086\MyBuild_
```assembly
org 100h
jmp start
    file db 'README2.md', 0    ;can dua file README2.md vao folder cai emu8086 truoc(..\emu8086\MyBuild\)
    handle dw ?
    str db 10000 dup('$')
start:

    mov ah, 3Dh
    lea dx, file
    mov al, 0        ;chi cho phep doc
    int 21h
    mov handle, ax

    mov ah, 3fh
    lea dx, str
    mov cx, 10000     ;read tung dong
    mov bx, handle
    int 21h
    
    lea dx, str
    mov ah, 9         ;in ra man hinh
    int 21h
    
    mov ah, 3eh
    mov bx, handle    ;dong file
    int 21h

ret
```
- Solution 2:
```c
#include <stdio.h>

int main()
{
    FILE *f;
    char str[10000];
    f=fopen("README2.md", "r");   //file README2.md can o trong folder

    fscanf(f, "%[^\0]", str);

    printf("%s", str);
    
    return 0;
}
```
- Test case:

The program printed so fast that I can not show all the output. But you can try to run and see it!

![image](https://user-images.githubusercontent.com/86862725/159132213-0abe5681-ba36-4e8e-b500-2520ae7f26fa.png)

7/ Problem 7:

Find the **longest common substring**.

Given two strings, **S** of length m and **T** of length n , find the longest string which is substring of both **S** and **T**.

- This is the most difficult problem in my assignment. I can not use Assembly to solve it anymore! So, I will show **C code** only.
```c
#include <stdio.h>
#include <string.h>
#include <stdlib.h>


int **matr, r = 0, c = 0;


void matrix_create(int l1, int l2)
{
	int i, j;
    if (l1+1 > r || l2+1 > c)
	{
		for (i = 0; i < r; i++)
			free(matr[i]);			//lam sach memory
		free(matr);
	
		matr = (int **)malloc((l1+1) * sizeof(int*));
		for (i = 0; i < l1+1; i++)
			matr[i] = (int *)malloc((l2+1) * sizeof(int));

		r = l1+1;
		c = l2+1;
    }

    for (i = 0; i <= l1; i++)
	matr[i][l2] = 0;
    for (j = 0; j <= l2; j++)
	matr[l1][j] = 0;
}


void LCS(char *S, char *T, char **lcs)
{
    int l1, l2, i, j;
	l1 = strlen(S);
	l2 = strlen(T);

    matrix_create(l1, l2);

    int max_len, max_index_i;
	max_len = 0;
	max_index_i = -1;

    for (i = l1-1; i >= 0; i--)
	{
    	for (j = l2-1; j >= 0; j--)
		{
    	    if (S[i] != T[j])
			{
				matr[i][j] = 0;
				continue;
    		}

    	    matr[i][j] = matr[i+1][j+1] + 1;
    	    if (matr[i][j] > max_len)
			{
				max_len = matr[i][j];
				max_index_i = i;
    	    }
    	}
    }

    if (lcs != NULL)
	{
		*lcs = malloc(sizeof(char) * (max_len+1));
		strncpy(*lcs, S+max_index_i, max_len);
		(*lcs)[max_len] = '\0';
		if (strlen(*lcs) != 0)
			printf("The longest common substring is: %s", *lcs);
		else
			printf("No common substring");
	}
    	
}


int main()
{
	char S[1000], T[1000];
	char *pqt;

        printf("S = ");
        scanf("%[^\n]", S);
        printf("T = ");
        scanf("%*c%[^\n]", T); 
        printf("\n");
    
        LCS(S, T, &pqt);

    return 0;
}
```
- Test case:

S = &quot;ABABC&quot;, T = &quot;BABCA&quot;

![image](https://user-images.githubusercontent.com/86862725/159132223-86b3b588-9f78-43ff-9c82-1640323ee6f7.png)

S = &quot;ABCDEFH&quot;, T = &quot;IJKLMNOPTQX&quot;

![image](https://user-images.githubusercontent.com/86862725/159132229-18fad2e1-ee3f-4f56-ad02-bcbeee60f922.png)

\
**© 2022,Pham Quoc Trung. All rights reserved.**
