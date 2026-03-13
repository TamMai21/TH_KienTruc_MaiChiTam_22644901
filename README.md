# Thuc Hanh PT

## Bài lab 2 - `kientructhlab2`

Project đã thêm ví dụ **Abstract Factory Pattern** theo mô hình tạo `PC` và `Server`.

### Các lớp chính
- `Computer`: abstract product
- `PC`, `Server`: concrete products
- `ComputerAbstractFactory`: abstract factory
- `PCFactory`, `ServerFactory`: concrete factories
- `ComputerFactory`: lớp gọi factory để tạo đối tượng
- `Lab2Main`: chương trình demo

### Chạy test
```powershell
.\gradlew test
```

### Chạy demo
Sau khi build, có thể chạy class `kientructhlab2.Lab2Main` từ IDE hoặc bằng lệnh:
```powershell
.\gradlew build
java -cp build\classes\java\main kientructhlab2.Lab2Main
```
