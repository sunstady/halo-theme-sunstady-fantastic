<#macro module name>
    <#if name == 'share'>
        <div class="right-tips column is-4-tablet is-1-desktop <#if is_sheet??>is-hidden-desktop</#if> is-1-widescreen is-1-fullhd  has-order-1 column-left is-hidden-touch <%= sticky_class(left) %>">
            <div class="level" style="position: fixed;top: 0;height: 100%;width: 30px;">
                <#if settings.share_type?? && settings.share_type!=''>
                    <#include "../share/${settings.share_type}.ftl">
                </#if>
            </div>
        </div>
    </#if>
    <#if name == 'slider'>
        <div class="blog-slider card">
            <div class="blog-slider__wrp swiper-wrapper">
                <#list posts.content as post>
                    <#if post.topPriority == 1>
                        <div class="blog-slider__item swiper-slide">
                            <div class="blog-slider__img">
                                <a href="${post.fullPath!}">
                                    <img src="${post.thumbnail!}" alt="${post.title!}">
                                </a>
                            </div>
                            <div class="blog-slider__content">
                                <span class="blog-slider__code">${post.createTime?string["yyyy-MM-dd EE"]}</span>
                                <div class="blog-slider__title "><a class="title is-5" href="${post.fullPath!}">${post.title!}</a></div>
                                <div class="blog-slider__text" content="">${post.summary!}</div>
                                <a href="${post.fullPath!}" class="blog-slider__button">阅读更多</a>
                            </div>
                        </div>
                    </#if>
                </#list>
            </div>
            <div class="blog-slider__pagination"></div>
        </div>

        <!-- partial -->
        <script src='${settings.cdn_jquery_js!}'></script>
        <script src='${settings.cdn_swiper_js!}'></script>
    </#if>
</#macro>
