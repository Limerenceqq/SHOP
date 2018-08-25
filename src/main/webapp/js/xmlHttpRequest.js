function xmlHttpRequest()
{
    xmlhttp=null;
    if (window.XMLHttpRequest)
    {// code for all new browsers
        xmlhttp=new XMLHttpRequest();
    }
    else if (window.ActiveXObject)
    {// code for IE5 and IE6
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    return xmlhttp;
}
