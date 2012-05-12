# Cascading Drop Down

## Description

CascadingDropDown is a jquery plugin that allows you to create cascading drop downs that depends on ajax to get the data. This plugin was created as an update to Raj Kaimal's
[CascadingDropDown jQuery plugin](http://weblogs.asp.net/rajbk/archive/2010/05/20/cascadingdropdown-jquery-plugin-for-asp-net-mvc.aspx) for ASP.NET MVC. Updates include support of dynamic drop downs. I will be updating this soon with features such as templating the dropdown list, etc.

## NuGet

Visual Studio users can install this directly into their .NET projects by executing the following command in the [Package Manager Console](http://docs.nuget.org/docs/start-here/using-the-package-manager-console)

    PM> Install-Package CascadingDropDown

## Changelog

## Build

To build you need the following:

  1. `rake` -> Install ruby, it comes with rake.
  2. `albacore` -> `gem install albacore`.
  3. `uglifier` -> `gem install uglifier` minifier
  4. `coffeescript` -> `npm install -g coffee-script` coffeescript compiler