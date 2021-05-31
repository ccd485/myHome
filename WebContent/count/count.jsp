<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*"%>
<!-- count.jsp -->
<%--
		jsp life cycle(jsp 생명주기)
		1. jspInit() : jsp파일이 실행될때 제일 먼저 불려가서 실행되는 메소드
		2. _jspService() : jspInit()메소드 실행 후(없으면 바로 이 메소드 실행) 실행
		3. jspDestroy() : 파일 종료시 불려가서 실행되는 메소드
		
		jspInit() 과 jspDestroy()는 오버라이드해서 사용한다
		_jspService() 는 오버라이드가 안된다
--%>

<%! 
		int count = 0;
		String path = "";
		public void jspInit(){
			path = this.getServletContext().getRealPath("count/count.txt");
			FileReader fr = null;
			BufferedReader br = null;
			try{
				fr = new FileReader(path);
				br = new BufferedReader(fr);
				String line = br.readLine();
				if (line != null){
					count = Integer.parseInt(line.trim());
				}
				br.close();
			}catch(FileNotFoundException e){
				System.err.println(e.getMessage());
				countSaveFile();
			}catch(IOException e){
				System.err.println(e.getMessage());
				countSaveFile();
			}
		}
		
		public void countSaveFile(){
			FileWriter fw = null;
			PrintWriter pw = null;
			try{
				fw = new FileWriter(path);
				pw = new PrintWriter(fw, true);
				pw.println(count);
				pw.close();
			}catch(IOException e){
				System.err.println(e.getMessage());
			}
		}
		
		public void jspDestroy(){
			countSaveFile();
		}
%>
<%
		if (session.isNew()){
			count++;
		}

		if (count%10 == 0){
			countSaveFile();
		}
%>
<b>방문횟수 : </b>
<%
		String countStr = String.valueOf(count);
		String upPath = request.getContextPath()+"/img/no";
		for(int i=0; i<countStr.length(); ++i){
			String filename = upPath +countStr.charAt(i)+".gif";%>
			<img src="<%=filename%>">
<%	}%>








