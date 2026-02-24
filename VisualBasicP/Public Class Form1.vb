Public Class Form1
    Private previous As Double
    Private op As String = ""
    Private current As String = ""
    Private Sub Number1_Click(sender As Object, e As EventArgs) Handles Number_1.Click
        current = current & "1"
        Label1.Text = current
    End Sub

    Private Sub Number2_Click(sender As Object, e As EventArgs) Handles Number_2.Click
        current = current & "2"
        Label1.Text = current
    End Sub

    Private Sub Number3_Click(sender As Object, e As EventArgs) Handles Number_3.Click
        current = current & "3"
        Label1.Text = current
    End Sub
    Private Sub Number_4_Click(sender As Object, e As EventArgs) Handles Number_4.Click
        current = current & "4"
        Label1.Text = current
    End Sub
    Private Sub Number_5_Click(sender As Object, e As EventArgs) Handles Number_5.Click
        current = current & "5"
        Label1.Text = current
    End Sub
    Private Sub Number_6_Click(sender As Object, e As EventArgs) Handles Number_6.Click
        current = current & "6"
        Label1.Text = current
    End Sub

    Private Sub Number_7_Click(sender As Object, e As EventArgs) Handles Number_7.Click
        current = current & "7"
        Label1.Text = current
    End Sub
    Private Sub Number_8_Click(sender As Object, e As EventArgs) Handles Number_8.Click
        current = current & "8"
        Label1.Text = current
    End Sub
    Private Sub Number_9_Click(sender As Object, e As EventArgs) Handles Number_9.Click
        current = current & "9"
        Label1.Text = current
    End Sub
    Private Sub Number_0_Click(sender As Object, e As EventArgs) Handles Number_0.Click
        current = current & "0"
        Label1.Text = current
    End Sub
    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Addition.Click
        If current <> "" Then
            If op <> "" Then
                'すでに演算子がある場合、先に計算する
                Dim currentNumber As Double = Double.Parse(current)

                If op = "+" Then
                    previous += currentNumber
                ElseIf op = "-" Then
                    previous -= currentNumber
                ElseIf op = "*" Then
                    previous *= currentNumber
                ElseIf op = "/" Then
                    previous /= currentNumber
                End If
            Else
                '最初の計算
                previous = Double.Parse(current)
            End If
            Label1.Text = previous.ToString()
            current = ""
        End If
        op = "+"
    End Sub

    Private Sub Button7_Click(sender As Object, e As EventArgs) Handles Subtraction.Click
        If current <> "" Then
            If op <> "" Then
                'すでに演算子がある場合、先に計算する
                Dim currentNumber As Double = Double.Parse(current)

                If op = "+" Then
                    previous += currentNumber
                ElseIf op = "-" Then
                    previous -= currentNumber
                ElseIf op = "*" Then
                    previous *= currentNumber
                ElseIf op = "/" Then
                    previous /= currentNumber
                End If
            Else
                '最初の計算
                previous = Double.Parse(current)
            End If
            Label1.Text = previous.ToString()
            current = ""
        End If
        op = "-"
    End Sub

    Private Sub Multiplication_Click(sender As Object, e As EventArgs) Handles Multiplication.Click
        If current <> "" Then
            If op <> "" Then
                'すでに演算子がある場合、先に計算する
                Dim currentNumber As Double = Double.Parse(current)

                If op = "+" Then
                    previous += currentNumber
                ElseIf op = "-" Then
                    previous -= currentNumber
                ElseIf op = "*" Then
                    previous *= currentNumber
                ElseIf op = "/" Then
                    previous /= currentNumber
                End If
            Else
                '最初の計算
                previous = Double.Parse(current)
            End If
            Label1.Text = previous.ToString()
            current = ""
        End If
        op = "*"
    End Sub

    Private Sub Division_Click(sender As Object, e As EventArgs) Handles Division.Click
        If current <> "" Then
            If op <> "" Then
                'すでに演算子がある場合、先に計算する
                Dim currentNumber As Double = Double.Parse(current)

                If op = "+" Then
                    previous += currentNumber
                ElseIf op = "-" Then
                    previous -= currentNumber
                ElseIf op = "*" Then
                    previous *= currentNumber
                ElseIf op = "/" Then
                    previous /= currentNumber
                End If
            Else
                '最初の計算
                previous = Double.Parse(current)
            End If
            Label1.Text = previous.ToString()
            current = ""
        End If
        op = "/"
    End Sub

    Private Sub Button5_Click(sender As Object, e As EventArgs) Handles equal.Click
        If current = "" Then
            Exit Sub
        End If

        Dim result As Double = 0
        Dim currentNumber As Double = Double.Parse(current)

        If op = "+" Then
            result = previous + currentNumber
        ElseIf op = "-" Then
            result = previous - currentNumber
        ElseIf op = "*" Then
            result = previous * currentNumber
        ElseIf op = "/" Then
            result = previous / currentNumber
            If currentNumber = 0 Then
                MessageBox.Show("0では割れません")
                Exit Sub
            End If
            result = previous / currentNumber
        End If

        Label1.Text = result.ToString()
        current = result.ToString()
        op = ""
    End Sub

    Private Sub Button6_Click(sender As Object, e As EventArgs) Handles Clear.Click
        current = ""
        previous = 0
        op = ""
        Label1.Text = "0"
    End Sub
End Class
