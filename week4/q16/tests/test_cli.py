import pytest

from greetlab.cli import main


def test_normal_name(monkeypatch, capsys):
    monkeypatch.setattr("sys.argv", ["sdt-greet", "--name", "alice"])
    main()
    assert capsys.readouterr().out == "Hello, alice!\n"


def test_blank_name(monkeypatch, capsys):
    monkeypatch.setattr("sys.argv", ["sdt-greet", "--name", "   "])
    with pytest.raises(SystemExit) as exc:
        main()
    assert exc.value.code == 2
    assert "must not be blank" in capsys.readouterr().err
