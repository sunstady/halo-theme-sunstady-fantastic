<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="author" content="viggo" />
    <title>网址导航 - ${blog_title!}</title>
    <meta name="keywords" content="网址导航">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Arimo:400,700,400italic">
    <link rel="stylesheet" href="${theme_base!}/source/assets/css/fonts/linecons/css/linecons.css">
    <link rel="stylesheet" href="//s.xinac.net/static/font-awesome/v4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${theme_base!}/source/assets/css/bootstrap.css">
    <link rel="stylesheet" href="${theme_base!}/source/assets/css/xenon-core.css">
    <link rel="stylesheet" href="${theme_base!}/source/assets/css/xenon-components.css">
    <link rel="stylesheet" href="${theme_base!}/source/assets/css/xenon-skins.css">
    <link rel="stylesheet" href="${theme_base!}/source/assets/css/nav.css">
    <script src="//s.xinac.net/static/jquery/v1.12.4/jquery.min.js"></script>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="//s.xinac.net/static/html5shiv/v3.7.2/html5shiv.min.js"></script>
    <script src="//s.xinac.net/static/respond/v1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="page-body">
<!-- skin-white -->
<div class="page-container">
    <div class="sidebar-menu toggle-others fixed">
        <div class="sidebar-menu-inner">
            <header class="logo-env">
                <!-- logo -->
                <div class="logo">
                    <a href="/" class="logo-expanded">
                      <p style="font-color:white;font-size:24px;">${blog_title!}</p>
                        <!--<img src="${user.avatar!}" width="80%" alt="${user.description!}" />-->
                    </a>
                    <a href="/" class="logo-collapsed">
                        <img src="${user.avatar!}" width="40" alt="${user.description!}" />
                    </a>
                </div>
                <div class="mobile-menu-toggle visible-xs">
                    <a href="#" data-toggle="user-info-menu">
                        <i class="linecons-cog"></i>
                    </a>
                    <a href="#" data-toggle="mobile-menu">
                        <i class="fa-bars"></i>
                    </a>
                </div>
            </header>

            <ul id="main-menu" class="main-menu">
    <@linkTag method="listTeams">
        <#list teams as item>
            <#if item.team?? && item.team != ''>
                <li>
                    <a href="#${item.team!}" class="smooth">
                        <i class="fa fa-leaf fa-fw"></i>
                        <span class="title">${item.team!}</span>
                    </a>
                </li>
            <#else>
                <li>
                    <a href="#未分类" class="smooth">
                        <i class="fa fa-leaf fa-fw"></i>
                        <span class="title">未分类</span>
                    </a>
                </li>
            </#if>
        </#list>
                <li>
                    <a href="/s/about" target="_blank">
                        <i class="fa fa-comment fa-fw"></i>
                        <span class="tooltip-blue">关于本站</span>
                    </a>
                </li>
    </@linkTag>
            </ul>
        </div>
    </div>
    <div class="main-content">
        <nav class="navbar user-info-navbar" role="navigation">
            <!-- User Info, Notifications and Menu Bar -->
            <!-- Left links for user info navbar -->
            <ul class="user-info-menu left-links list-inline list-unstyled">
                <li class="hidden-sm hidden-xs">
                    <a href="#" data-toggle="sidebar">
                        <i class="fa-bars"></i>
                    </a>
                </li>
            </ul>
        </nav>

        <@linkTag method="listTeams">
            <#list teams as item>
            <#if item.team?? && item.team != ''>
                <h4 class="text-gray"><i class="linecons-tag" style="margin-right: 7px;" id="${item.team!}"></i>${item.team!}</h4>
            <#else>
                <h4 class="text-gray"><i class="linecons-tag" style="margin-right: 7px;" id="未分类"></i>未分类</h4>
            </#if>
                <div class="row">
                <#list item.links?sort_by('priority')?reverse as link>
                    <#if link.name?starts_with("-1") || link.name?ends_with("-1")>
                        <#continue>
                    </#if>
                    <div class="col-sm-3">
                        <div class="xe-widget xe-conversations box2 label-info" onclick="window.open('${link.url!}', '_blank')" data-toggle="tooltip" data-placement="bottom" title="${link.url!}" data-original-title="${link.url!}">
                            <div class="xe-comment-entry">
                                <a class="xe-user-img">
                                    <#if link.logo?? && link.logo != ''>
                                        <img data-src="${link.logo!}" class="lozad img-circle" width="40">
                                    <#else>
                                        <#--
                                        <img data-src="${theme_base!}/source/images/gg.jpg" class="lozad img-circle" width="40">
                                        -->
                                        <img data-src="https://api.xinac.net/icon/?url=${link.url!}" class="lozad img-circle" width="40">
                                    </#if>
                                </a>
                                <div class="xe-comment">
                                    <a href="#" class="xe-user-name overflowClip_1">
                                        <strong>${link.name!}</strong>
                                    </a>
                                    <p class="overflowClip_2">${link.description!}</p>
                                </div>
                            </div>
                        </div>
                    </div>
            <#if link_index == 3>
                </div>
                <div class="row">
            </#if>
                </#list>
                </div>
                <br />
            </#list>
        </@linkTag>

        <footer class="main-footer sticky footer-type-1">
            <div class="footer-inner">
                <!-- Add your copyright text here -->
                <div class="footer-text">
					<#if settings.busuanzi!true>
                    <p style="text-align: left; line-height: 20px; margin: 0">
                        <script async src="${settings.cdn_busuanzi_js!}"></script>
                        <br>
                        <span id="busuanzi_container_site_pv" style='display:none'>总访问量 <span id="busuanzi_value_site_pv"></span> 次 </span>
                        <span id="busuanzi_container_site_uv" style='display:none'>| 总访客数 <span id="busuanzi_value_site_uv"></span> 人 </span>
                    </p>
                </#if>
                <#if settings.bokejishi!true>
                    <p style="text-align: left; line-height: 20px;margin: 0">
                        似水流年：&nbsp;&nbsp;<span id="clock"></span><br>
                    </p>
                    <script type="text/javascript">
						/* 尾部定时 */
						var int = self.setInterval("clock()", 1000);

						function clock() {
							var nowDay = new Date();
							var localDay = new Date("${settings.time_start!}");
							var time = parseInt((nowDay.getTime() - localDay.getTime()) / 1000);
							var min = parseInt(time / 60);
							var hour = parseInt(time / 60 / 60);
							var day = parseInt(time / 60 / 60 / 24);

							var runTime = "0";
							if (min == 0) {
								runTime = time + "秒";
							} else if (hour == 0) {
								runTime = min + "分" + (time - min * 60) + "秒";
							} else if (day == 0) {
								var mh = min - hour * 60;
								runTime = hour + "时" + mh + "分" + (time - hour * 3600 - mh * 60) + "秒"
							} else {
								var hd = hour - day * 24;
								var mh = min - day * 24 * 60 - hd * 60;
								runTime = day + " 天 " + hd + " 时 " + mh + " 分 " + (time - day * 24 * 3600 - hd * 3600 - mh * 60) + " 秒 ";
							}

							document.getElementById('clock').innerHTML = runTime;
						}
                    </script>
                </#if>
                <#if settings.social_beian?? && settings.social_beian!=''>
                    <p style="text-align: left; line-height: 20px;">
                        <a target="_blank" href="http://beian.miit.gov.cn/" style="color: black;font-style: inherit;font-weight: inherit;">
                            ${settings.social_beian!}
                        </a>
                    </p>
                </#if>
                <#if settings.social_free?? && settings.social_free!=''>
                    <p style="text-align: left; line-height: 20px; margin: 0">
                        ${settings.social_free!}
                    </p>
                </#if>
                  <!--<script type="text/javascript" src="//s.xinac.net/static/js_foot.js"></script>-->
                </div>
                <!-- Go to Top Link, just add rel="go-top" to any link to add this functionality -->
                <div class="go-up">
                    <a href="#" rel="go-top">
                        <i class="fa-angle-up"></i>
                    </a>
                </div>
            </div>
        </footer>
    </div>
</div>
<!-- 锚点平滑移动 -->
<script type="text/javascript">
    $(document).ready(function() {
        //img lazy loaded
        const observer = lozad();
        observer.observe();

        $(document).on('click', '.has-sub', function(){
            var _this = $(this)
            if(!$(this).hasClass('expanded')) {
                setTimeout(function(){
                    _this.find('ul').attr("style","")
                }, 300);

            } else {
                $('.has-sub ul').each(function(id,ele){
                    var _that = $(this)
                    if(_this.find('ul')[0] != ele) {
                        setTimeout(function(){
                            _that.attr("style","")
                        }, 300);
                    }
                })
            }
        })
        $('.user-info-menu .hidden-sm').click(function(){
            if($('.sidebar-menu').hasClass('collapsed')) {
                $('.has-sub.expanded > ul').attr("style","")
            } else {
                $('.has-sub.expanded > ul').show()
            }
        })
        $("#main-menu li ul li").click(function() {
            $(this).siblings('li').removeClass('active'); // 删除其他兄弟元素的样式
            $(this).addClass('active'); // 添加当前元素的样式
        });
        $("a.smooth").click(function(ev) {
            ev.preventDefault();

            public_vars.$mainMenu.add(public_vars.$sidebarProfile).toggleClass('mobile-is-visible');
            ps_destroy();
            $("html, body").animate({
                scrollTop: $($(this).attr("href")).offset().top - 30
            }, {
                duration: 500,
                easing: "swing"
            });
        });
        return false;
    });

    var href = "";
    var pos = 0;
    $("a.smooth").click(function(e) {
        $("#main-menu li").each(function() {
            $(this).removeClass("active");
        });
        $(this).parent("li").addClass("active");
        e.preventDefault();
        href = $(this).attr("href");
        pos = $(href).position().top - 30;
    });
</script>
<!-- Bottom Scripts -->
<script src="${theme_base!}/source/assets/js/bootstrap.min.js"></script>
<script src="${theme_base!}/source/assets/js/TweenMax.min.js"></script>
<script src="${theme_base!}/source/assets/js/resizeable.js"></script>
<script src="${theme_base!}/source/assets/js/joinable.js"></script>
<script src="${theme_base!}/source/assets/js/xenon-api.js"></script>
<script src="${theme_base!}/source/assets/js/xenon-toggles.js"></script>
<!-- JavaScripts initializations and stuff -->
<script src="${theme_base!}/source/assets/js/xenon-custom.js"></script>
<script src="${theme_base!}/source/assets/js/lozad.js"></script>

<script type="text/javascript" src="//s.xinac.net/static/baidu_push.js"></script>
<script type="text/javascript" src="//s.xinac.net/stat/js_stat_baidu_blog.xinac.cn.js"></script>
<script type="text/javascript" src="//s.xinac.net/stat/js_stat_baidu_www.xinac.cn.js"></script>
<div style="display: none;">
    <script type="text/javascript" src="//s.xinac.net/static/js_stat.js"></script>
</div>

</body>
</html>
