﻿Feature: LoginFeature
	In order to avoid silly mistakes
	As a math idiot
	I want to be told the sum of two numbers

@LoginFeature
Scenario: 登入測試(登入成功)
	Given 至"http://localhost:3148/"登入帳號
	And 輸入帳號dd123456
	And 輸入密碼dd123456
	When 按下提交按鈕
	Then 登入管理者頁面 頁面並有Sign Out標誌 代表登入成功
