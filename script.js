// TODO: write this function
function getContentType (contentBlock) {
    if ("logo"   in contentBlock) return "module" ;
    if ("images" in contentBlock) return "blurb"  ;
    if ("points" in contentBlock) return "listing";
    return null;
}

function makeContentBlock (contentType, content) {
    if (contentType == "module" ) return makeModule (content);
    if (contentType == "blurb"  ) return makeBlurb  (content);
    if (contentType == "listing") return makeListing(content);
    return document.createElement("div");
}

function makeModule (content) {
    let container  = document.createElement("div");
    let imgDiv     = document.createElement("div");
    let logo       = document.createElement("img");
    let contentDiv = document.createElement("div");
    let header     = document.createElement("div");
    let title      = document.createElement("p"  );
    let date       = document.createElement("p"  );
    let brief      = document.createElement("p"  );
    let full       = document.createElement("div");
    let links      = document.createElement("p"  );

    container .className = "module"            ;
    imgDiv    .className = "module-img-div"    ;
    contentDiv.className = "module-content-div";
    header    .className = "module-header"     ;
    title     .className = "module-title"      ;
    date      .className = "module-date"       ;
    brief     .className = "module-brief"      ;
    full      .className = "module-full"       ;
    links     .className = "module-links"      ;

    logo .src       = content["logo" ];
    title.innerHTML = content["title"];
    date .innerHTML = content["date" ];
    brief.innerHTML = content["brief"];

    let makeP = function (text) {
        let temp = document.createElement("p");
        temp.innerHTML = text;
        return temp;
    }

    let makeA = function (aObj) {
        let temp = document.createElement("a");
        temp.innerHTML = aObj["text"];
        temp.href      = aObj["link"];
        return temp;
    }

    container .appendChild(imgDiv    );
    container .appendChild(contentDiv);
    imgDiv    .appendChild(logo      );
    contentDiv.appendChild(header    );
    contentDiv.appendChild(brief     );
    contentDiv.appendChild(full      );
    contentDiv.appendChild(links     );
    header    .appendChild(title     );
    header    .appendChild(date      );
    for (let i = 0; i < content["full"].length; i++)
        full.appendChild(makeP(content["full"][i]));
    for (let i = 0; i < content["links"].length; i++) {
        if (i) links.innerHTML += " | ";
    	links.appendChild(makeA(content["links"][i]));
    }
    
    return container;
}

function makeBlurb (content) {
    let container = document.createElement("div");

    container.className = "blurb";

    let makeImg = function (imgSrc) {
        let temp = document.createElement("img");
        temp.src = imgSrc;
        return temp;
    }

    let makeP = function (text) {
        let temp = document.createElement("p");
        temp.innerHTML = text;
        return temp;
    }

    for (let i = 0; i < content["images"].length; i++)
    	container.appendChild(makeImg(content["images"][i]));
    for (let i = 0; i < content["text"].length; i++)
    	container.appendChild(makeP(content["text"][i]));

    return container;
}

function makeListing (content) {
    let container = document.createElement("div");
    let title     = document.createElement("h3" );
    let list      = document.createElement("ul" );

    container.className = "listing";

    title.innerHTML = content["title"];

    let makeLi = function (text) {
        let temp = document.createElement("li");
        temp.innerHTML = text;
        return temp;
    }

    container.appendChild(title);
    container.appendChild(list );
    for (let i = 0; i < content["points"].length; i++)
        list.appendChild(makeLi(content["points"][i]));

    return container;
}

function makeSection (sectionContent) {
    if (sectionContent["content"].length == 0) return null;

    let container  = document.createElement("section");
    let title      = document.createElement("h2"     );
    let contentDiv = document.createElement("div"    );

    let contentType = getContentType(sectionContent["content"][0]);

    contentDiv.className = contentType + "-container";

    title.innerHTML = sectionContent["title"];

    container.appendChild(title     );
    container.appendChild(contentDiv);
    for (let i = 0; i < sectionContent["content"].length; i++) {
        contentDiv.appendChild(makeContentBlock(contentType, sectionContent["content"][i]));
    }

    return container;
}

function main () {
    for (let sectionNumber in content) {
        let madeSection = makeSection(content[sectionNumber]);
        if (madeSection)
            document.getElementById("section-container").appendChild(madeSection);
    }
}

main();
