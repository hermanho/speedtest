<%@ Page LANGUAGE="C#" Debug="false" %>
<script runat="server">
string GetClientIP()
{
    string ip = null;
    if (String.IsNullOrEmpty(Request.ServerVariables["HTTP_X_FORWARDED_FOR"]) || Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToUpper().IndexOf("UNKNOWN") > 0)
    {
        ip = Request.ServerVariables["REMOTE_ADDR"];
    }
    else if (Request.ServerVariables["HTTP_X_FORWARDED_FOR"].IndexOf(",") > 0)
    {
        ip = Request.ServerVariables["HTTP_X_FORWARDED_FOR"].Substring(1, Request.ServerVariables["HTTP_X_FORWARDED_FOR"].IndexOf(",") - 1);
    }
    else if (Request.ServerVariables["HTTP_X_FORWARDED_FOR"].IndexOf(";") > 0)
    {
        ip = Request.ServerVariables["HTTP_X_FORWARDED_FOR"].Substring(1, Request.ServerVariables["HTTP_X_FORWARDED_FOR"].IndexOf(";") - 1);
    }
    else
    {
        ip = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
    }

    return ip.Replace(" ", string.Empty);
}
</script>
<%
Response.Write(GetClientIP());
%>
