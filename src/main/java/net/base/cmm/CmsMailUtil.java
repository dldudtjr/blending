package net.base.cmm;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Component;

import egov.cmm.service.EgovProperties;
import net.app.vo.MailVO;

@Component("cmsMailUtil")
public class CmsMailUtil {

    @Autowired
    private JavaMailSenderImpl mailSender;

    public void sendMailCertify(MailVO vo) { // 제목과 내용만을 보내는 기본 발송입니다.
        String charSet = "UTF-8" ;

        try {
            MimeMessage message = this.mailSender.createMimeMessage();
            message.setHeader("Content-Type", "text/html; charset=utf-8");
            message.addRecipient(RecipientType.TO, new InternetAddress(vo.getTo()));
            if("ko".equals(vo.getLang())){
                message.setSubject("[블렌딩트렌드]  이메일 인증 ", charSet);
            }else {
                message.setSubject("[BLENDING TREND]  Email certification", charSet);
            }
            vo.setRtnUrl(getHostName(vo));

            SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
            Date date = new Date();
            vo.setNow(format1.format(date)+"");

            message.setText(makeMailFrm(vo), charSet, "html");
            this.mailSender.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void sendMailPw(MailVO vo) { // 제목과 내용만을 보내는 기본 발송입니다.
        String charSet = "UTF-8" ;

        try {
            MimeMessage message = this.mailSender.createMimeMessage();
            message.setHeader("Content-Type", "text/html; charset=utf-8");
            message.addRecipient(RecipientType.TO, new InternetAddress(vo.getTo()));
            if("en".equals(vo.getLang())){
                vo.setSubject("[BLENDING TREND] Guide to Finding Your Password");
                vo.setContents("BLENDING TREND Guide to Finding Your Password");
            }else {
                vo.setSubject("[블렌딩트렌드] 비밀번호 찾기 안내");
                vo.setContents("블렌딩트렌드 비밀번호 찾기 안내");
            }
            message.setSubject(vo.getSubject(), charSet);
            vo.setRtnUrl(getHostNamePw(vo));

            SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
            Date date = new Date();
            vo.setNow(format1.format(date)+"");

            message.setText(makeMailFrmPw(vo), charSet, "html");
            this.mailSender.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String makeMailFrm(MailVO vo) {
        String msgA="";
        String msgB="";
        String msgC="본인이 아닌 경우 아래 고객센터로 즉시 연락바랍니다.";
        String msgD="블렌딩 트렌드  비밀번호 찾기 안내";
        String msgE="안녕하세요.";
        String msgF="아래의 링크를 클릭하여 비밀번호를 변경해주세요.";
        String msgG="비밀번호 변경하기 ";
        String msgH="본 메일은 발신전용메일이므로 문의 및 회신하실 경우 답변되지 않습니다. ";
        String msgI="블렌딩트렌드 서비스 관련 문의 사항은 blendingtrend21@gmail.com 로 문의하여 주시기 바랍니다. ";

        if("en".equals(vo.getLang())){
            msgA="has been sent to ";
            msgB="as a recovery email.";
            msgC="If you are not the person, please contact the customer center below.";
            msgD="Guide to Finding the BLENDING TREND Password";
            msgE="Hi.";
            msgF="Please click the link below to change your password.";
            msgG="Change password ";
            msgH="This e-mail is for sending only, so it will not be answered if you inquire or reply. ";
            msgI="Please contact blendingtrend21@gmail.com if you have any questions related to Innovating Service. ";
        } else {
            msgA="";
            msgB="인증 이메일로 표시되어 이 메시지가 발송되었습니다.";
            msgC="본인이 아닌 경우 아래 고객센터로 즉시 연락바랍니다.";
            msgD="블렌딩트렌드 이메일 인증  안내";
            msgE="안녕하세요.";
            msgF="아래의 링크를 클릭하여 이메일 인증을 완료 해주세요.";
            msgG="이메일 인증 하기 ";
            msgH="본 메일은 발신전용메일이므로 문의 및 회신하실 경우 답변되지 않습니다. ";
            msgI="블렌딩트렌드 서비스 관련 문의 사항은 blendingtrend21@gmail.com로 문의하여 주시기 바랍니다. ";

        }

        StringBuilder str = new StringBuilder();
        str.append("<html>");
        str.append("<head>");
        str.append("<meta charset=\"utf-8\">");
        str.append("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
        str.append("<meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">");
        str.append("</head>");
        str.append("<body>");

        str.append("<div style=\"width:560px; height:78px; background:#F2F2F2; margin-bottom:20px; display:flex; justify-content:center; align-items:center;\">");
        str.append("<p style=\"font-size:13px; color:#6F6F6F; line-height:22px; margin:20px;\">");
        str.append("<strong style=\"color:#000000;\"> </strong><br>"+msgC+"</p>");
        str.append("</div>");
        str.append("<div style=\"width:560px; overflow:hidden; border:1px solid #666666; border-radius:10px;\">");
        str.append("<div style=\"height:54px; line-height:54px; color:#fff; letter-spacing:2px; font-weight:900; font-size:19px; padding:0 40px; linear-gradient(to top, #20c159 0%, #19851c 60%) \">Blending Trend</div>");
        str.append("<div style=\"padding:0 30px 10px;\">");
        str.append("<p style=\"color:#6F6F6F; font-size:12px; line-height:30px; text-align:right;\"> " + vo.getNow() + " </p>");
        str.append("<h2 style=\"font-size:24px; font-weight:900; letter-spacing:-2px; margin:0 0 25px;\">"+msgD+"</h2>");
        str.append("<p style=\"font-size:16px; line-height:30px; margin:0;\">"+msgE+"<br>"+msgF+"</p>");
        str.append("<div style=\"width:270px; height:52px; background:#64c148; border-radius:5px; font-size:20px; line-height:52px; color:#fff; font-weight:900; text-align:center; margin:30px auto 60px;\"><a style=\"color:#fff; text-decoration:none; \" href='" + vo.getRtnUrl() + "'>"+msgG+"</a></div>");
        str.append("<p style=\"font-size:12px; line-height:20px; color:#6F6F6F;\">"+msgH+"<br>");
        str.append(""+msgI+"<br>Copyright. © 2022 Blending Trend,Inc. All rights reserved.</p>");
        str.append("</div>");
        str.append("</div>");

        str.append("</body>");
        str.append("</html>");
        return str.toString();
    }

    public String makeMailFrmPw(MailVO vo) {
        String msgA="이(가)";
        String msgB="의 복구 이메일로 표시되어 이 메시지가 발송되었습니다.";
        String msgC="본인이 아닌 경우 아래 고객센터로 즉시 연락바랍니다.";
        String msgD="블렌딩 트렌드  비밀번호 찾기 안내";
        String msgE="안녕하세요.";
        String msgF="아래의 링크를 클릭하여 비밀번호를 변경해주세요.";
        String msgG="비밀번호 변경하기 ";
        String msgH="본 메일은 발신전용메일이므로 문의 및 회신하실 경우 답변되지 않습니다. ";
        String msgI="블렌딩트렌드 서비스 관련 문의 사항은 blendingtrend21@gmail.com 로 문의하여 주시기 바랍니다. ";


        StringBuilder str = new StringBuilder();
        str.append("<html>");
        str.append("<head>");
        str.append("<meta charset=\"utf-8\">");
        str.append("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
        str.append("<meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">");
        str.append("</head>");
        str.append("<body>");

        str.append("<div style=\"width:560px; height:78px; background:#F2F2F2; margin-bottom:20px; display:flex; justify-content:center; align-items:center;\">");
        str.append("<p style=\"font-size:13px; color:#6F6F6F; line-height:22px; margin:20px;\">");
        str.append("<strong style=\"color:#000000;\"> " + vo.getUserId() + " </strong>"+msgA+" " + vo.getEmail() + " "+msgB+"<br>"+msgC+"</p>");
        str.append("</div>");
        str.append("<div style=\"width:560px; overflow:hidden; border:1px solid #666666; border-radius:10px;\">");
        str.append("<div style=\"height:54px; line-height:54px; color:#fff; letter-spacing:2px; font-weight:900; font-size:19px; padding:0 40px; background-image: -webkit-linear-gradient(bottom, #2052C1 0%, #0B1845 60%); background-image: -o-linear-gradient(bottom, #2052C1 0%, #0B1845 60%); background-image: linear-gradient(to top, #2052C1 0%, #0B1845 60%);\">Blendging Trend</div>");
        str.append("<div style=\"padding:0 30px 10px;\">");
        str.append("<p style=\"color:#6F6F6F; font-size:12px; line-height:30px; text-align:right;\"> " + vo.getNow() + " </p>");
        str.append("<h2 style=\"font-size:24px; font-weight:900; letter-spacing:-2px; margin:0 0 25px;\">"+msgD+"</h2>");
        str.append("<p style=\"font-size:16px; line-height:30px; margin:0;\">"+msgE+"<br>"+msgF+"</p>");
        str.append("<div style=\"width:270px; height:52px; background:#0841C4; border-radius:5px; font-size:20px; line-height:52px; color:#fff; font-weight:900; text-align:center; margin:30px auto 60px;\"><a style=\"color:#fff; text-decoration:none; \" href='" + vo.getRtnUrl() + "'>"+msgG+"</a></div>");
        str.append("<p style=\"font-size:12px; line-height:20px; color:#6F6F6F;\">"+msgH+"<br>");
        str.append(""+msgI+"<br>Copyright. © 2022 Blending Trend,Inc. All rights reserved.</p>");
        str.append("</div>");
        str.append("</div>");

        str.append("</body>");
        str.append("</html>");
        return str.toString();
    }

    public static String getHostName(MailVO vo) {
        vo.setRtnUrl("http://" + EgovProperties.getProperty("hostName") + "/web/lgn/" + vo.getRtnVal() + "/usrCertUdt.bt");
        return vo.getRtnUrl();
    }

    public static String getHostNamePw(MailVO vo) {
        vo.setRtnUrl("http://" + EgovProperties.getProperty("hostName") + "/web/lgn/" + vo.getRtnVal() + "/pwChangeUdt.lp");
        return vo.getRtnUrl();
    }

}