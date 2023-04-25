global ArrayMinimum_

ArrayMinimum_:
	; по умолчанию полагаем, что результат
	; это первый элемент массива
	mov eax, [rdi]

	; ecx = length
	mov ecx, esi
	; edx = 0
	xor edx, edx

loop:
	; текущий элемент — базовое смещение +
	; смещение по индексу
	mov esi, [rdi + 4 * rdx]

	; сравниваем текущий элемент с текущим минимальным
	cmp esi, eax
	; если текущий элемент больше или равен текущему
	; минимальному, то не обновляем результат
	jge false_result
	mov eax, esi

false_result:
	; увеличиваем индекс
	inc rdx

	; проверяем, не достигли ли мы конца
	cmp rcx, rdx
	jne loop
end:
	ret
