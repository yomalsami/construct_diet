import 'package:construct_diet/common/avatar.dart';
import 'package:construct_diet/common/diet.dart';
import 'package:construct_diet/common/page_transition.dart';
import 'package:construct_diet/scoped_models/data_model.dart';
import 'package:construct_diet/screens/diet_info_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:shimmer/shimmer.dart';

import 'buttons.dart' as custom;

class ButtonLabel extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  ButtonLabel(this.title,
      {this.description, this.icon, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: Colors.grey.withAlpha(30),
          splashColor: Colors.grey.withAlpha(30),
          onTap: onPressed,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  children: <Widget>[
                    icon != null
                        ? Container(
                            margin: EdgeInsets.only(right: 15),
                            child: Icon(
                              icon,
                              size: 20,
                              color: color ?? Theme.of(context).primaryColor,
                            ),
                          )
                        : Container(),
                    Container(
                      width: MediaQuery.of(context).size.width >= 750
                          ? 750 - 140.0
                          : MediaQuery.of(context).size.width - 140,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(title,
                              strutStyle: StrutStyle(
                                leading: 0,
                              ),
                              style: Theme.of(context).textTheme.title),
                          description != null
                              ? Padding(
                                  padding: EdgeInsets.only(top: 3),
                                  child: Text(
                                    description,
                                    style: Theme.of(context).textTheme.subtitle,
                                  ),
                                )
                              : Container()
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.chevron_right,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContributorLabel extends StatelessWidget {
  final String title;
  final String nickname;
  final String avatarUrl;
  final int additions;
  final int deletions;
  final VoidCallback onPressed;

  ContributorLabel(this.title,
      {this.nickname,
      this.avatarUrl,
      this.additions,
      this.deletions,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(4, 5, 4, 5),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: Colors.grey.withAlpha(30),
          splashColor: Colors.grey.withAlpha(30),
          onTap: onPressed,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: avatarUrl == null
                            ? Container(
                                width: 26,
                                height: 26,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withAlpha(15),
                                  borderRadius: BorderRadius.circular(26),
                                ))
                            : Avatar(size: 26, url: avatarUrl)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(title,
                            strutStyle: StrutStyle(
                              leading: 0,
                            ),
                            style: Theme.of(context).textTheme.title),
                        nickname != null
                            ? Padding(
                                padding: EdgeInsets.only(top: 3.2),
                                child: Text(
                                  nickname,
                                  style: Theme.of(context).textTheme.subtitle,
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ],
                ),
                Positioned(
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        MdiIcons.arrowUpBold,
                        size: 15,
                        color: Theme.of(context).primaryColorLight,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1, right: 4),
                        child: Text(
                          additions.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(fontSize: 14),
                        ),
                      ),
                      Icon(
                        MdiIcons.arrowDownBold,
                        size: 15,
                        color: Theme.of(context).errorColor,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1),
                        child: Text(
                          deletions.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContributorShimmerLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(4, 9, 4, 9),
      child: Shimmer.fromColors(
        highlightColor: Colors.grey.withAlpha(45),
        baseColor: Colors.grey.withAlpha(15),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Container(
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(26),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 12,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 6),
                        height: 10,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 12,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DialogButtonLabel extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPressed;

  DialogButtonLabel(this.title, {this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: Colors.grey.withAlpha(30),
          splashColor: Colors.grey.withAlpha(30),
          onTap: onPressed,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              alignment: Alignment.center,
              child: Text(title,
                  strutStyle: StrutStyle(
                    leading: 0,
                  ),
                  style:
                      Theme.of(context).textTheme.title.copyWith(color: color)),
            ),
          ),
        ),
      ),
    );
  }
}

class DietLabel extends StatelessWidget {
  final Diet diet;

  DietLabel(this.diet);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: InkWell(
          highlightColor: Colors.grey.withAlpha(30),
          splashColor: Colors.grey.withAlpha(30),
          onTap: () {
            ScopedModel.of<DataModel>(context).closeTip();
            Navigator.push(
              context,
              Theme.of(context).platform == TargetPlatform.iOS
                  ? CupertinoPageRoute(builder: (_) => DietInfoPage(diet))
                  : TransitionPageRoute(widget: DietInfoPage(diet)),
            );
          },
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 8.5, 2, 8.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      diet.name,
                      strutStyle: StrutStyle(
                        leading: 0,
                      ),
                      style: Theme.of(context).textTheme.title,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3.2),
                      child: Text(
                        diet.description,
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 14.5),
                  child: Row(
                    children: List<Widget>.generate(
                      diet.icons.length,
                      (i) {
                        return Padding(
                          padding: EdgeInsets.all(3),
                          child: Icon(
                            diet.icons[i],
                            size: 12.2,
                            color: Theme.of(context)
                                .textTheme
                                .caption
                                .color
                                .withAlpha(200),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoLabel extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  InfoLabel(this.title, {this.description, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: description != null
          ? EdgeInsets.fromLTRB(18, 14.5, 18, 14.5)
          : EdgeInsets.fromLTRB(18, 19.5, 18, 19.5),
      child: Row(
        crossAxisAlignment: description.contains("\n")
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: <Widget>[
          icon != null
              ? Container(
                  margin: EdgeInsets.only(
                    right: 12,
                    top: description.contains("\n") ? 5 : 0,
                  ),
                  child: Icon(
                    icon,
                    size: 20,
                    color: color ?? Theme.of(context).primaryColor,
                  ))
              : Container(),
          Container(
            width: MediaQuery.of(context).size.width >= 750
                ? 750 - 140.0
                : MediaQuery.of(context).size.width - 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title,
                    strutStyle: StrutStyle(
                      leading: 0,
                    ),
                    style: Theme.of(context).textTheme.title),
                description != null
                    ? Padding(
                        padding: EdgeInsets.only(top: 3),
                        child: Text(
                          description,
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SwitchLabel extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final bool value;
  final ValueChanged<bool> onChanged;

  SwitchLabel(this.title,
      {this.description, this.icon, this.color, this.value, this.onChanged});

  @override
  _SwitchLabelState createState() => _SwitchLabelState(this.value);
}

class PlugLabel extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  PlugLabel(this.title, {this.description, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(18, 21, 18, 21),
      child: Column(
        children: <Widget>[
          icon != null
              ? Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Icon(
                    icon,
                    size: 40,
                    color: color ?? Theme.of(context).primaryColor,
                  ))
              : Container(),
          Column(children: [
            Text(
              title,
              textAlign: TextAlign.center,
              strutStyle: StrutStyle(
                leading: 0,
              ),
              style: Theme.of(context).textTheme.title,
            ),
            description != null
                ? Padding(
                    padding: EdgeInsets.only(top: 3.2),
                    child: Text(
                      description,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                  )
                : Container()
          ]),
        ],
      ),
    );
  }
}

class SelectFavoriteLabel extends StatefulWidget {
  final String title;
  final IconData icon;
  final int isLiked;
  final ValueChanged<int> onChanged;

  SelectFavoriteLabel(this.title, {this.icon, this.isLiked, this.onChanged});

  @override
  _SelectFavoriteLabelState createState() => _SelectFavoriteLabelState();
}

class TitleLabel extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;
  final double paddingTop;
  final double paddingBottom;

  TitleLabel(this.title,
      {this.icon, this.child, this.paddingTop = 14, this.paddingBottom = 2});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(18, paddingTop, 18, 0),
          child: Row(
            children: <Widget>[
              icon != null
                  ? Container(
                      margin: EdgeInsets.only(right: 15),
                      child: Icon(
                        icon,
                        size: 18,
                        color: Theme.of(context)
                            .textTheme
                            .subhead
                            .color
                            .withAlpha(180),
                      ))
                  : Container(),
              Center(
                child: Text(
                  title,
                  strutStyle: StrutStyle(
                    leading: 0,
                  ),
                  style: Theme.of(context).textTheme.subhead,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: paddingBottom),
          child: child,
        ),
      ],
    );
  }
}

class DisplayLabel extends StatelessWidget {
  final String title;
  final Widget child;

  DisplayLabel(
    this.title, {
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.body1,
          ),
          Container(
            child: child,
          ),
        ],
      ),
    );
  }
}

class _SwitchLabelState extends State<SwitchLabel> {
  bool value;
  _SwitchLabelState(this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: Colors.grey.withAlpha(30),
          splashColor: Colors.grey.withAlpha(30),
          onTap: () {
            setState(() {
              value = !value;
            });
            widget.onChanged(value);
          },
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    widget.icon != null
                        ? Container(
                            margin: EdgeInsets.only(right: 15),
                            child: Icon(
                              widget.icon,
                              size: 20,
                              color: widget.color ??
                                  Theme.of(context).primaryColor,
                            ))
                        : Container(),
                    Container(
                      width: MediaQuery.of(context).size.width > 750
                          ? 750.0 - 320.0
                          : MediaQuery.of(context).size.width - 164,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.title,
                              style: Theme.of(context).textTheme.title,
                            ),
                            widget.description != null
                                ? Padding(
                                    padding: EdgeInsets.only(top: 3.2),
                                    child: Text(
                                      widget.description,
                                      style:
                                          Theme.of(context).textTheme.subtitle,
                                    ),
                                  )
                                : Container()
                          ]),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IgnorePointer(
                    ignoring: true,
                    child: Theme.of(context).platform == TargetPlatform.iOS
                        ? SizedBox(
                            width: 65,
                            height: 35,
                            child: CupertinoSwitch(
                                value: value, onChanged: widget.onChanged))
                        : SizedBox(
                            width: 55,
                            height: 35,
                            child: Switch(
                                value: value, onChanged: widget.onChanged)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SelectFavoriteLabelState extends State<SelectFavoriteLabel> {
  int isLiked;

  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(13, 5, 8, 5),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(right: 15),
                      child: Icon(
                        widget.icon,
                        size: 20,
                        color: Theme.of(context).primaryColor,
                      )),
                  Container(
                    width: MediaQuery.of(context).size.width > 750
                        ? 750.0 - 185.0
                        : MediaQuery.of(context).size.width - 185,
                    child: Text(widget.title,
                        strutStyle: StrutStyle(
                          leading: 0,
                        ),
                        style: Theme.of(context).textTheme.title),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  custom.IconSwitch(
                    icon: Icon(
                      MdiIcons.thumbUpOutline,
                      size: 18,
                      color: Theme.of(context)
                          .textTheme
                          .caption
                          .color
                          .withAlpha(150),
                    ),
                    selectedIcon: Icon(
                      MdiIcons.thumbUp,
                      size: 18,
                      color: Theme.of(context).primaryColorLight,
                    ),
                    value: isLiked == 1,
                    onChanged: (isOn) {
                      if (isOn) {
                        setState(() {
                          isLiked = 1;
                        });
                        widget.onChanged(isLiked);
                      } else if (isLiked == 1) {
                        setState(() {
                          isLiked = 0;
                        });
                        widget.onChanged(isLiked);
                      }
                    },
                  ),
                  custom.IconSwitch(
                    icon: Icon(
                      MdiIcons.thumbDownOutline,
                      size: 18,
                      color: Theme.of(context)
                          .textTheme
                          .caption
                          .color
                          .withAlpha(150),
                    ),
                    selectedIcon: Icon(
                      MdiIcons.thumbDown,
                      size: 18,
                      color: Theme.of(context).errorColor,
                    ),
                    value: isLiked == 2,
                    onChanged: (isOn) {
                      if (isOn) {
                        setState(() {
                          isLiked = 2;
                        });
                        widget.onChanged(isLiked);
                      } else if (isLiked == 2) {
                        setState(() {
                          isLiked = 0;
                        });
                        widget.onChanged(isLiked);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
