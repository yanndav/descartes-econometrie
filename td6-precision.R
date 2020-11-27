View(base_final)

base_sub = base_final %>% 
  filter(Country.Code=='FRA' | Country.Code=='BWA')

View(base_sub)

reg1 = lm(Yield ~`Urban Pop`, data=base_sub)
summary(reg1)


reg2 = lm(Yield ~`Urban Pop`, data=base_sub[base_sub$Country.Code=='FRA',])
summary(reg2)

reg3 = lm(Yield ~`Urban Pop`, data=base_sub[base_sub$Country.Code=='BWA',])
summary(reg3)


base_sub <- base_sub %>% 
  mutate(FRA = ifelse(Country.Code=='FRA',1,0))


view(base_sub)

reg4 = lm(Yield ~ `Urban Pop` + FRA + `Urban Pop` * FRA, data=base_sub )
summary(reg4)

summary(reg3)
