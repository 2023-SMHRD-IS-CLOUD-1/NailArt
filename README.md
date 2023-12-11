# NailArt(네일아트) 팀명: 손톱뜯지마
![image](https://github.com/2023-SMHRD-IS-CLOUD-1/NailArt/assets/105231826/a4644fdd-829f-4868-8075-73b528d59b3f)


### 제작 기간 : 23.10.25 ~ 23.12.08

## 1. 서비스 소개

   ### 서비스 설명:


    1. 직접 사용자의 손에 네일 디자인을 입혀볼 수 있는 서비스 제공
    2. 디자인을 입혀보고 바로 네일샵까지 예약을 할 수 있는 기능 제공
    3. 사용자가 각 네일샵의 별점과 리뷰를 볼 수 있음

# 2. 주요 기능

고객
   - 이미지 오버레이를 통한 본인의 손에 디자인 입히기 기능
   - 원하는 가게의 위치 확인가능
   - 원하는 날짜와 시간에 서비스 예약 가능
   - 가게의 리뷰를 확인가능


가게 관리자
   - 가게 등록 후 썸네일 이미지 업로드 가능
   - 가게의 디자이너 추가 및 삭제 가능
   - 가게의 스케줄 관리 가능


# 3. 사용 언어 및 도구




# 4. 시스템 아키텍처

![화면 캡처 2023-12-07 094825](https://github.com/2023-SMHRD-IS-CLOUD-1/NailArt/assets/142488051/63bbd27a-1574-44ea-8d31-956bd8de377b)



# 5. ER 다이어그램

![image](https://github.com/2023-SMHRD-IS-CLOUD-1/NailArt/assets/105231826/aca3a501-57c0-4f9f-87f8-3b2f2dad1eda)




# 6. 개발 내용




# 7. 화면 구성

<details>
    <summary>화면구성 보기</summary>
<!-- summary 아래 한칸 공백 두고 내용 삽입 -->
   
   #### 메인
   ![메인페이지](https://github.com/2023-SMHRD-IS-CLOUD-1/NailArt/assets/105231826/448c48b2-0c08-4422-afd8-9e390a179352)
   #### 디자인 페이지
   ![image](https://github.com/2023-SMHRD-IS-CLOUD-1/NailArt/assets/105231826/274733a7-53de-449d-87be-b57b98f863e5)
   #### 샵 페이지
   ![샵페이지](https://github.com/2023-SMHRD-IS-CLOUD-1/NailArt/assets/105231826/b67f7711-2f86-450e-a110-a7dc6d68aad7)
   #### 예약 서비스
   ![예약서비스](https://github.com/2023-SMHRD-IS-CLOUD-1/NailArt/assets/105231826/784b26a4-0947-40bd-9713-8e74692237df)
   #### 리뷰 서비스
   ![image](https://github.com/2023-SMHRD-IS-CLOUD-1/NailArt/assets/105231826/0a6acd4c-b60b-4e8e-aefb-5616db61f5f6)

   
</details>


# 8. 참고문헌

- 손톱 검출을 이용한 가상 네일아트문새별* 허훈 오정수 부경대학교
(https://koreascience.kr/article/CFKO202132348467219.pdf)
- 행정안전부
(https://www.localdata.go.kr/main.do)
- 네일 데이터 정보 논문
https://blog.naver.com/PostView.naver?blogId=dbsyhe&logNo=222675412974
- 네일아트 트렌드 기사
https://cosinkorea.com/mobile/article.html?no=48944
- 한국대한 신문
https://news.unn.net/news/articleView.html?idxno=543278




# 9. 개발환경
|                     분류 | 설명                                                              |
|-------------------------:|-------------------------------------------------------------------|
| 운영체제                 | Windows10                                                         |
| 버전 관리 시스템         | Github                                                            |
| 개발 도구                | Eclipse IDE (2023-06), Jupyter notebook, vs code                  |
| 개발 언어 및 프레임 워크 | Java 1.8.0_202, Js, Python 3.11.4, conda 23.7.2                   |
| 데이터 베이스            | ORACLE 11                                                         |
| 하드웨어                 | NVIDIA GeForce RTX 2070,Intel(R) Core(TM) i7-10700 CPU,RAM 16.0GB |



# 10. 팀원소개
<table>
  <tbody>
    <tr>
      <td align="center"><a href="https://github.com/kkksssmmmm"><img src="https://avatars.githubusercontent.com/u/105231826?v=4" width="100px;" height="100px;" alt=""/><br /><sub><b> 팀장 : 김성민</b></sub></a><br /></td>
      <td align="center"><a href="https://github.com/Jinkyun0328"><img src="" width="100px;" alt=""/><br /><sub><b> 부팀장 : 최진균</b></sub></a><br /></td>
      <td align="center"><a href=""><img src="" width="100px;" alt=""/><br /><sub><b> 팀원 : 이하연</b></sub></a><br /></td>
     <tr/>
      <td align="center"><a href="https://github.com/phc1235"><img src="" width="100px;" alt=""/><br /><sub><b> 팀원 : 박형찬</b></sub></a><br /></td>
      <td align="center"><a href="https://github.com/wannabeMIR"><img src="" width="100px;" alt=""/><br /><sub><b> 팀원 : 김동균</b></sub></a><br /></td>
      <td align="center"><a href=""><img src="" width="100px;" alt=""/><br /><sub><b> 팀원 : 이승호</b></sub></a><br /></td>
    </tr>
  </tbody>
</table>



# 11. API
### https://app.roboflow.com/smart-fwoom/nail-8e9wp/deploy/2 - roboflow (딥러닝)                       
### https://flatpickr.js.org/ - 플랫피커 (예약)                   
### https://fullcalendar.io/ - 풀캘린더 (달력)                   
### https://developers.kakao.com/product/map - 카카오맵 (지도)                   



# 12. 파일 설명
### NailProject : 자바 프로젝트                   
### Flask : python 플라스크 서버 데이터                 
### data : 산출물 및 발표자료, 시연영상 등 저장                 







