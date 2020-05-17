import Foundation

var table = [[String]]()
let strange = "You input something strange.\nPlease, check the format again: you must write the 'ROW COLUMN', so your input will look like '1 2' or '0 3' (without quotes, obviously)."

func start(){
    table = [[" "," "," "],[" "," "," "],[" "," "," "]]
    print("Basic Tic-tac-toe (tabled)")
    print("    1    2    3")
    print("1  1 1  2 1  3 1")
    print("2  1 2  2 2  3 2")
    print("3  1 3  2 3  3 3")
    print("\nYou are the 'X' in the table.")
    play()
}

func play(){
    print("\n  1  2  3")
    print("1 \(table[0][0])  \(table[0][1])  \(table[0][2])")
    print("2 \(table[1][0])  \(table[1][1])  \(table[1][2])")
    print("3 \(table[2][0])  \(table[2][1])  \(table[2][2])")
    checkWin()
    print("Enter the cell you want to put in your symbol in format 'ROW COLUMN':")
    let answer = readLine()
    let splitted = answer?.split(separator: " ")
    guard splitted?.capacity == 2 else {
        print(strange)
        play()
        return
    }
    for e in splitted! {
        let num = Int(e)
        guard num != nil && num! <= 3 && num! >= 1 else {
            print(strange)
            play()
            return
        }
    }
    let n1 = Int(splitted![0]) ?? 0
    let n2 = Int(splitted![1]) ?? 0
    var somebody = ""
    guard table[n1 - 1][n2 - 1] == " " else {
        if table[n1 - 1][n2 - 1] == "X" {
            somebody = "you"
        } else {
            somebody = "computer"
        }
        print("This cell is already taken by \(somebody)! Enter another.")
        play()
        return
    }
    table[n1 - 1][n2 - 1] = "X"
    AI()
    play()
}

func checkWin(){
    if table[0][0] == table[0][1] && table[0][0] == table[0][2] && table[0][0] != " " {
        win(sym: table[0][0])
        return
    } else if table[1][0] == table[1][1] && table[1][0] == table[1][2] && table[1][0] != " " {
        win(sym: table[1][0])
        return
    } else if table[2][0] == table[2][1] && table[2][0] == table[2][2] && table[2][0] != " " {
        win(sym: table[2][0])
        return
    } else if table[0][0] == table[1][0] && table[0][0] == table[2][0] && table[0][0] != " " {
        win(sym: table[0][0])
        return
    } else if table[0][1] == table[1][1] && table[0][1] == table[2][1] && table[0][1] != " " {
        win(sym: table[0][1])
        return
    } else if table[0][2] == table[1][2] && table[0][2] == table[2][2] && table[0][2] != " " {
        win(sym: table[0][2])
        return
    } else if table[0][0] == table[1][1] && table[0][0] == table[2][2] && table[0][0] != " " {
        win(sym: table[0][0])
        return
    } else if table[0][2] == table[1][1] && table[0][2] == table[2][0] && table[0][2] != " " {
        win(sym: table[0][2])
        return
    } else {return}
}

func win(sym: String) {
    var winner = ""
    if sym == "X" {
        winner = "player"
    } else if sym == "O" {
        winner = "computer"
    }
    print("The \(winner) won! Wanna play one more time? (y/n)")
    let input = readLine()
    if input == "y" {
        start()
        return
    } else {
        print("Bye-bye!")
        exit(0)
    }
}

func AI(){
    guard table[1][1] != " " else {
        table[1][1] = "O"
        return
    }
    for (i1, row) in table.enumerated().shuffled() {
        for (i2, item) in row.enumerated().shuffled() {
            guard item == "X" else {
                table[i1][i2] = "O"
                break
            }
        }
        break
    }
}

start()
