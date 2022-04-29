class Stage {
  String desc;
  String choice1;
  String choice2;

  Stage({this.desc = '', this.choice1 = '', this.choice2 = ''});
}

class Engine {
  int _currentStage = 0;
  bool storyEnd = false;
  List<Stage> history = [
    //Stage 1
    Stage(
      desc: 'Czerwony Kapturek idzie przez las, nagle spotkał...',
      choice1: 'niedźwiedź',
      choice2: 'rosomak',
    ),
    //Stage 2
    Stage(
      desc: 'Niedźwiedź poszedł dalej, bo...',
      choice1: 'spieszył się do lekarza',
      choice2: 'szedł właśnie do koleżanki',
    ),
    Stage(
      desc:
          'Rosomak przedstawił Kapturkowi najnowszą kolekcję herbat z owoców leśnych. Co na to Czerwony Kapturek?',
      choice1: 'Odpowiedział dziękuję ale wolę kawę',
      choice2: 'Kupił od rosomaka 3 paczki herbaty z jagód',
    ),
    //Stage 3
    Stage(
      desc:
          'Czerwony kapturek smutny patrzył jak niedźwiedż odchodził, ale zawołał do kapturka...',
      choice1: 'odwiedzę Cię jutro',
      choice2: 'zjem Cię jutro',
    ),
    Stage(
      desc:
          'Jak się później okazało oboje zmierzali w kierunku rosomaka, który',
      choice1: 'sprzedaje herbate',
      choice2: 'poluje na Czerwonego Kapturka',
    ),
    Stage(
      desc:
          'Rosomak odpowiedział na to - Nie szkodzi Kapturku mam do sprzedania dużo kawy tureckiej. Co było dalej?',
      choice1: 'Kapturek kupił paczkę kawy',
      choice2: 'Kapturek stwierdził że produkty rosomaka sa za drogie',
    ),
    Stage(
      desc:
          'Kapturek zaparzył sobie herbate od rosomaka i wypił 2 kubki. Po chwili okakzało się że...',
      choice1: 'herbata była trucizną',
      choice2: 'pomimo jej przeterminowania była bardzo smaczna',
    ),
    Stage(
      desc:
      'Koniec Gry',
      choice1: 'Zagraj jeszcze raz',
      choice2: '',
    )
  ];
  String getDesc() {
    if (storyEnd==true) _currentStage = 0;
    return history[_currentStage].desc;
  }

  String getChoice({required int $i}) {
    if(storyEnd){
       _currentStage=0;
       storyEnd=false;
    }
    if ($i == 1) {
      return history[_currentStage].choice1;
    } else {
      return history[_currentStage].choice2;
    }
  }

  void nextStage(int choice) {
    _currentStage=(_currentStage*2)+choice;
    if(_currentStage >= history.length){
      _currentStage = 7;
      storyEnd = true;
    }
  }
}
