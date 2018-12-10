### Practice
* 透過宷一個計算機來練習`TDD`和`MVVM`
* 產生Code Coverage報表

### 心得
* 這次需要以`TDD`的方式並用`MVVM`的架構做一個計算機。`TDD`簡單說就是先寫測式的程式，再寫真正的程式。之前雖然一直想這樣做，但無奈沒什麼時間，剛好可以趁這次練習，中間在實作程式的時候，真的有體會到先寫測試的好處，明明做完了，測試卻不過，回頭仔細檢查還真的有寫錯，這情況大約發生三四次，等全部測過之後再把UI接起來就做完了。

#### 實作
* 先設計`ViewModel`，概念是所有的`View`如果要改動計算機的顯示時一定要透過`ViewModel`，主畫面會監聽`ViewModel`的`displayString`的值來改變顯示。一開始我先定好`ViewModel`的`interface`，然後定測試的方法，全部定完後開始寫測式程式，全部寫完後跑一次測式，結果全部失敗，再來就是要實作`ViewModel`的程式，慢慢把每一個失敗變成功。都成功後才開始實作UI。

* 再來就是要跑覆蓋率，必需要安裝`gcovr`和`ocunit2junit`。在跑script時有幾個需要注意的地方。
  * 確認模擬器型號及版本
  * 在跑xcodebuild時需要把兩個環境變數設成`YES`分別是`GCC_INSTRUMENT_PROGRAM_FLOW_ARCS`,`GCC_GENERATE_TEST_COVERAGE_FILES`。
  * 最後`gcovr`需要給根目錄`-r .`，第一次使用時建議加`-v`方便找出問題在哪。
