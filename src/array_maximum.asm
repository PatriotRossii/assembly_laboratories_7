global ArrayMaximum_

ArrayMaximum_:
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

	; если текущий элемент больше максимального,
	; то это наш новый результат
	cmp esi, eax
	cmovg eax, esi

	; увеличиваем индекс
	inc edx

	; проверяем, не достигли ли мы конца
	cmp ecx, edx
	jne loop
end:
	ret