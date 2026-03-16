#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    int n;
    
    printf("Введите размер матрицы N: ");
    scanf("%d", &n);
    
    if (n <= 0) {
        printf("Ошибка: размер должен быть положительным\n");
        return 1;
    }
    
    // Выделение памяти
    int **matrix = (int **)malloc(n * sizeof(int *));
    for (int i = 0; i < n; i++) {
        matrix[i] = (int *)malloc(n * sizeof(int));
    }
    
    // Заполнение случайными числами
    srand(time(NULL));
    printf("\nИсходная матрица:\n");
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            matrix[i][j] = rand() % 9 + 1;
            printf("%3d ", matrix[i][j]);
        }
        printf("\n");
    }
    
    // Сумма главной диагонали
    int sum = 0;
    for (int i = 0; i < n; i++) {
        sum += matrix[i][i];
    }
    
    // Произведение побочной диагонали
    int product = 1;
    for (int i = 0; i < n; i++) {
        product *= matrix[i][n - 1 - i];
    }
    
    int diff = sum - product;
    
    printf("\nСумма главной диагонали: %d\n", sum);
    printf("Произведение побочной диагонали: %d\n", product);
    printf("Разность (сумма - произведение): %d\n", diff);
    
    // Замена элементов не на диагоналях
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            if (i != j && i != n - 1 - j) {
                matrix[i][j] = diff;
            }
        }
    }
    
    printf("\nПреобразованная матрица:\n");
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            printf("%3d ", matrix[i][j]);
        }
        printf("\n");
    }
    
    // Освобождение памяти
    for (int i = 0; i < n; i++) {
        free(matrix[i]);
    }
    free(matrix);
    
    return 0;
}
