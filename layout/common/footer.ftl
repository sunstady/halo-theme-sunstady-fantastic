<style>
.footer {
    padding: 0.5rem 2rem 2rem !important;
}
</style>
<footer class="footer">
    <div class="container">
        <div class="level">
            <div class="level-start has-text-centered-mobile">
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
                <#if settings.caidai!true>
                    <script src="${theme_base!}/source/lib/caidai.js"></script>
                </#if>
                <#if settings.xiantiao!true>
                    <script type="text/javascript"
                            color="47,135,193" opacity='0.8' zIndex="-2" count="100"
                            src="${settings.cdn_canvas_nest_js!}">
                    </script>
                </#if>
                <#if settings.dianji!true>
                    <script src="${theme_base!}/source/lib/dianji.js"></script>
                </#if>
                <@global.footer />
            </div>
            <div class="level-end">
                <div class="field has-addons is-flex-center-mobile has-mt-5-mobile is-flex-wrap is-flex-middle">
                    ${settings.links_footer!}
                </div>
            </div>
        </div>
    </div>
</footer>
