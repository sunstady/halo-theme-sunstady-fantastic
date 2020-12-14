<#--用来做HTML大概的框架，和一些重要的css和js文件的引入-->
<#macro layout title>
    <!DOCTYPE html>
    <html lang="zh-CN">
    <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <title>${title!}</title>
    <meta name="keywords" content="${meta_keywords!}" />
    <meta name="description" content="${meta_description!}" />

    <#--BootStrap CSS-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha256-L/W5Wfqfa0sdBNIKN9cG6QA5F2qx4qICmU2VgLruv9Y=" crossorigin="anonymous">

    <#include "../layout/plugin/style.theme.ftl">
      
    <link rel="stylesheet" href="${settings.cdn_bulma_css!}" />
    <link rel="stylesheet" href="${settings.cdn_fontawesome_css!}" />
    <link rel="stylesheet" href="${theme_base!}/source/css/bundle.css" />
    <link rel="stylesheet" href="${theme_base!}/source/css/back-to-top.css" />
    <link rel="stylesheet" href="${theme_base!}/source/css/style.css" />

    <style>
        * {font-size: 14px}
        a:hover {text-decoration: none;background: none !important;}
        .page-link:hover {background: #337ab7 !important;}
        .container {
            padding-right: 0px;
            padding-left: 0px;
        }
        .navbar-brand {
          	margin-right: 0px;
        }
        .text-muted {
            color: none !important;
            font-weight: inherit !important;
        }
    </style>
    <#--日志界面的样式-->
    <#if is_journal?? || is_journals??>  
        <#--代码高亮用到的CSS-->
        <link rel="stylesheet" href="${theme_base!}/source/css_simple/github_markdown.css">
        <link href="${settings.code_css_url!'https://cdn.staticfile.org/highlight.js/9.18.1/styles/github.min.css'}"
                  rel="stylesheet">    
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css" integrity="sha256-Vzbj7sDDS/woiFS3uNKo8eIuni59rjyNGtXfstRzStA=" crossorigin="anonymous">    
        <link rel="stylesheet" href="${theme_base!}/source/css_simple/journals.css">        
        <style>
            blockquote {
                background-color: #EBEDED !important;
                color: var(--color) !important;
            }
            ul {
                list-style-type: circle;
                padding-left: 3rem !important;
            }
	    ul ul{
		list-style-type: square;
            }
            /*用户的操作链接划过颜色*/
            .journals .journal-item .journal-operation a:hover {
              	color: ${settings.hover_color!'#dc3545'} !important;
            }
        </style>
    </#if>    
    </head>
    <body>
    <#--  导航栏  -->
	<#include "../layout/common/head.ftl">
	<#include "../layout/common/navbar.ftl">
    <@navbar 'page' />
      
    <#--主要内容-->
    <#nested>

    <!-- 公共BootStrap支持使用的JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha256-/ijcOLwFf26xEYAjW75FizKVo5tnTYiQddPZoLUHHZ8=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha256-WqU1JavFxSAMcLP2WIOI+GB2zWmShMI82mTpLDcqFUg=" crossorigin="anonymous"></script>

    <#-- 公共底部代码，包含：统计代码，底部信息 -->
    <#include "../layout/common/footer.ftl">
      
	<#if is_journal?? || is_journals??>
        <script src="https://cdn.jsdelivr.net/npm/@fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.js" integrity="sha256-yt2kYMy0w8AbtF89WXb2P1rfjcP/HTHLT7097U8Y5b8=" crossorigin="anonymous"></script>
        <script type="text/javascript" src="${theme_base!}/source/js_simple/journals.js"></script>
    </#if>
    <div id="backTop" class="back-top">
        <span><i class="fas fa-caret-up"></i></span>
    </div>
    </body>
    </html>
</#macro>
