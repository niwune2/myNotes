function sumAges(people) {
    let ageSum = 0;
    for (const person of people ) { // for in では意図しないプロパティまで拾ってしまう
        //console.log(people[person].name);//名前を順に表示する
        //personにはキーが代入される?
        //console.log(people[person].age);
        //ageSum += people[person].age; 
        ageSum += person.age;
    }
    return ageSum;
}

const peopleArray = [
    { name: "A", age: 10 },
    { name: "B", age: 20 },
    { name: "C", age: 30 },
];

console.log(sumAges(peopleArray));

