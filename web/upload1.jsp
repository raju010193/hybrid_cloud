<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>

<%@ page import="java.sql.*"%>

<%@page import="pack.Dbconnection"%>


<html>
<head>
</head>
<body>
<%

ArrayList list = new ArrayList();
		ServletContext context = getServletContext();

		String dirName =context.getRealPath("Gallery/");
		String paramname=null;
		String file=null;
		String a=null,b=null,c=null,d=null,ee=null,ff=null,image=null;
	
		FileInputStream fs=null;
 
		File file1 = null;
			
		
		try {
			
			MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); // 10MB

			Enumeration params = multi.getParameterNames();
			while (params.hasMoreElements()) 
			{
				paramname = (String) params.nextElement();
				if(paramname.equalsIgnoreCase("name"))
				{
					a=multi.getParameter(paramname);
				}
				
				if(paramname.equalsIgnoreCase("file"))
				{
					image=multi.getParameter(paramname);
				}
                               
				
				
				
				}
					
			int f = 0;
	Enumeration files = multi.getFileNames();	
	while (files.hasMoreElements()) 
	{
		paramname = (String) files.nextElement();
		if(paramname.equals("d1"))
		{
			paramname = null;
		}
		
		if(paramname != null)
		{
			f = 1;
			image = multi.getFilesystemName(paramname);
			String fPath = context.getRealPath("Gallery\\"+image);
			file1 = new File(fPath);
			fs = new FileInputStream(file1);
			list.add(fs);
			
			
				
		
			
			
			
			
			
			
		}		
	}
        
        HttpSession user=request.getSession();
String uname=user.getAttribute("username").toString();   
String name=user.getAttribute("name").toString();   

        Random r = new Random();
            int i = r.nextInt(1000-500)+500;
            String k = i+"";
        
        java.util.Date now = new java.util.Date();
	 String DATE_FORMAT1 = "dd/MM/yyyy HH:mm";
	 SimpleDateFormat sdf1 = new SimpleDateFormat(DATE_FORMAT1);
         String strDateNew1 = sdf1.format(now);
         out.println(strDateNew1);
	
	        FileInputStream fs1 = null;
            //name=dirName+"\\Gallery\\"+image;
			int lyke=0;
			String as="Rejected";
                       boolean flag=true;
			
 Connection con=Dbconnection.getConn();
  PreparedStatement st=con.prepareStatement("select* from file");
  ResultSet resultSet=st.executeQuery();
  while(resultSet.next()){
          if(a.equals(resultSet.getString("filename"))){
          flag=false;                 
          }
  }
  if(flag){
 PreparedStatement ps=con.prepareStatement("insert into file (content,idfiles,filename,uploadtime,owner)values(?,?,?,?,?)");

 ps.setBinaryStream(1, (InputStream)fs, (int)(file1.length()));
 
 	ps.setString(2,k);
               	ps.setString(3,a);
					
       			ps.setString(4,strDateNew1);
       			ps.setString(5,name);
       			
				
       if(f == 0)
			ps.setObject(2,null);
		else if(f ==2)
		{
			fs1 = (FileInputStream)list.get(0);
			ps.setBinaryStream(2,fs1,fs1.available());
		}	
			int x=ps.executeUpdate();
		
			response.sendRedirect("upload.jsp?status");
                                        }
  else{
       response.sendRedirect("upload.jsp?failed");
  }
  %>
<p><a href="upload.jsp">Back</a>  </p>

</body>
			  </html>
			  <%
			
				
		} 
		catch (Exception e) 
		{
                    e.printStackTrace();
                    response.sendRedirect("upload.jsp?failed");
			out.println(e.getMessage());
		}
	
 %>
</body>
</html>

