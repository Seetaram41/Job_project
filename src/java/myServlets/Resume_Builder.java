/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myServlets;
import JavaClasses.Database_Connect;
import JavaClasses.Path_Details;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.awt.Font;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Deepak
 */
public class Resume_Builder extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        try
        {
            //------------------------------------------------
            HttpSession session=req.getSession();
            String name=(String)session.getAttribute("session_name");
            String email=(String)session.getAttribute("session_email");
            String profilepic=(String)session.getAttribute("session_profile_pic_path");
            

            //------------------------------------------------
            String address=req.getParameter("address");
            String career_objective=req.getParameter("career_objective");
            String hobbies=req.getParameter("hobbies");

            String marital_status = req.getParameter("marital_status");
            String language=req.getParameter("language");
            String dob = req.getParameter("dob");
            String gender = req.getParameter("gender");

            //1. create pdf file name
            String resume_pdf_name=email+".pdf";
            //2. create Document class object
            Document document=new Document();
            //3. Get PdfWriter instance
            PdfWriter writer=PdfWriter.getInstance(document, new FileOutputStream(Path_Details.RESUME_BUILDER_PATH+resume_pdf_name));
            //4. Open document
            document.open();
            
            //------------title------------------------
            String font_name="Arial";
            float font_size=18;
            int style=Font.BOLD;
            Paragraph title=new Paragraph("Resume", FontFactory.getFont(font_name, font_size, style, BaseColor.RED));
            document.add(title);
            //------------------------------------------
            
            Paragraph emptyspace=new Paragraph(" ");
            document.add(emptyspace);
            
            //----------image, name & email-------------------
            Image image1=Image.getInstance(Path_Details.PROFILE_PIC_PATH+profilepic);
            image1.scaleAbsolute(100f, 100f);
            document.add(image1);
            
            Paragraph namee=new Paragraph(name);
            document.add(namee);
            
            int email_font_size=10;
            Paragraph emaill=new Paragraph("("+email+")", FontFactory.getFont(font_name, email_font_size));
            document.add(emaill);
            //-----------------------------------------
            
            document.add(emptyspace);
            
            //------------career objective-------------
            String co_font_name="Arial";
            float co_font_size=10;
            int co_style=Font.ITALIC;
            Paragraph careertitle=new Paragraph("Career Objective", FontFactory.getFont(co_font_name, co_font_size, co_style, BaseColor.PINK));
            document.add(careertitle);
            
            Paragraph career=new Paragraph(career_objective);
            document.add(career);
            //-----------------------------------------
            
            document.add(emptyspace);
            
            //-------------educational qualifications--------------------
            Paragraph eduquatitle=new Paragraph("Educational Qualifications", FontFactory.getFont(co_font_name, co_font_size, co_style, BaseColor.PINK));
            document.add(eduquatitle);
            
            PdfPTable table=new PdfPTable(4);
            
            table.setSpacingBefore(20);
            
            PdfPCell c1=new PdfPCell(new Phrase("Year"));
            table.addCell(c1);
            
            PdfPCell c2=new PdfPCell(new Phrase("School/College"));
            table.addCell(c2);
            
            PdfPCell c3=new PdfPCell(new Phrase("Field"));
            table.addCell(c3);
            
            PdfPCell c4=new PdfPCell(new Phrase("Grade"));
            table.addCell(c4);
            
            String yearr1="", schooll1="", degreee1="", gradee1="";
            Connection con1=null;
            try
            {
                con1=Database_Connect.getConnection();
                PreparedStatement ps1=con1.prepareStatement("select * from education_details where email=?");
                ps1.setString(1, email);
                ResultSet rs1=ps1.executeQuery();
                while(rs1.next())
                {
                    yearr1=rs1.getString("year");
                    schooll1=rs1.getString("school");
                    degreee1=rs1.getString("field");
                    gradee1=rs1.getString("grade");
                    
                    table.addCell(yearr1);
                    table.addCell(schooll1);
                    table.addCell(degreee1);
                    table.addCell(gradee1);
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            
            document.add(table);
            //-----------------------------------------------------------
            
            document.add(emptyspace);
            
            //-------------experience qualifications--------------------
            Paragraph exptitle=new Paragraph("Experience", FontFactory.getFont(co_font_name, co_font_size, co_style, BaseColor.PINK));
            document.add(exptitle);
            
            PdfPTable table2=new PdfPTable(4);
            
            table2.setSpacingBefore(20);
            
            PdfPCell exc1=new PdfPCell(new Phrase("Year"));
            table2.addCell(exc1);
            
            PdfPCell exc2=new PdfPCell(new Phrase("School/College"));
            table2.addCell(exc2);
            
            PdfPCell exc3=new PdfPCell(new Phrase("Degree"));
            table2.addCell(exc3);
            
            PdfPCell exc4=new PdfPCell(new Phrase("Grade"));
            table2.addCell(exc4);
            
            String exyearr1="", companyy1="", locationn1="", jobtitlee1="";
            Connection con2=null;
            try
            {
                con2=Database_Connect.getConnection();
                PreparedStatement ps2=con2.prepareStatement("select * from experience_details where email=?");
                ps2.setString(1, email);
                ResultSet rs2=ps2.executeQuery();
                while(rs2.next())
                {
                    exyearr1=rs2.getString("year");
                    companyy1=rs2.getString("company");
                    locationn1=rs2.getString("location");
                    jobtitlee1=rs2.getString("department");
                    
                    table2.addCell(exyearr1);
                    table2.addCell(companyy1);
                    table2.addCell(locationn1);
                    table2.addCell(jobtitlee1);
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            
            
            document.add(table2);
            //-----------------------------------------------------------
            
            document.add(emptyspace);
            
            //------------hobbies-------------
            Paragraph hobbies2=new Paragraph("Hobbies", FontFactory.getFont(co_font_name, co_font_size, co_style, BaseColor.PINK));
            document.add(hobbies2);
            
            Paragraph myhobbies=new Paragraph(hobbies);  
            document.add(myhobbies);
            //-----------------------------------------
            
            document.add(emptyspace);
            
            //------------personal information-------------
            
            Paragraph perinfo=new Paragraph("Personal Information", FontFactory.getFont(co_font_name, co_font_size, co_style, BaseColor.PINK));
            document.add(perinfo);
            
            Paragraph dob2=new Paragraph("Date Of Birth : "+dob);
            document.add(dob2);
            
            Paragraph gender1=new Paragraph("Gender  : "+gender);//*********
            document.add(gender1);
            
            Paragraph merital2=new Paragraph("Gender / Marital Status : "+marital_status);
            document.add(merital2);
            
            Paragraph langpro=new Paragraph("Language Proficiency : "+language);
            document.add(langpro);
            
            Paragraph addr=new Paragraph("Address : "+address);
            document.add(addr);
            //-----------------------------------------
            
            document.add(emptyspace);
            
            //------------declaration-------------
            Paragraph decl=new Paragraph("DECLARATION", FontFactory.getFont(co_font_name, co_font_size, co_style, BaseColor.PINK));
            document.add(decl);
            
            Paragraph mydescl=new Paragraph("I do hereby declare that the above information is true to the best of my knowledge.");
            document.add(mydescl);
            //-----------------------------------------
            
            document.add(emptyspace);
            
            //------------last phase-------------
            
            Paragraph lname=new Paragraph("Name : "+name);
            document.add(lname);
            
            Date d=new Date();
            SimpleDateFormat sdf1=new SimpleDateFormat("dd/MM/yyyy");
            
            Paragraph datee=new Paragraph("Date : "+sdf1.format(d));
            document.add(datee);
            //-----------------------------------------
            
            //last step : close the document
            document.close();
            
            Connection con4 = Database_Connect.getConnection();
          
            String sql_query = "update resume_builder set address =? ,career = ?, hobbies=?, marital=?, language=? where email=?";
            PreparedStatement ps4 =con4.prepareStatement( sql_query);
            ps4.setString(1, address);
            ps4.setString(2, career_objective);
            ps4.setString(3, hobbies);
            ps4.setString(4, marital_status);
            ps4.setString(5, language);
            ps4.setString(6, email);
            
            int rowCount = ps4.executeUpdate();
            if(rowCount>0){
                resp.sendRedirect("profile.jsp");
            }
            else{
                out.print("error");
            }
            
        }
        catch(Exception e)
        {
            out.print(e);
        }
    }
}

